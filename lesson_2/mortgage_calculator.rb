require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  /^\d+(\.\d*)?$/.match(num)
end

def get_valid_input(message_key, type=:float)
  loop do
    prompt(MESSAGES[message_key])
    input = gets.chomp
    if valid_number?(input) && input.to_f > 0
      return type == :float ? input.to_f : input.to_i
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
end

def calculate(a, j, n)
  a * (j / (1 - (1 + j)**(-n)))
end

prompt(MESSAGES['welcome_message'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Nice to meet you #{name}, I'm going to ask for a few bits of
information and provide your mortage loan monthly breakdown for you.")

loop do
  loan_amount = get_valid_input('loan_amount')
  apr = get_valid_input('apr')
  loan_duration = get_valid_input('loan_duration', :int)
  
  loop do
    prompt("Your loan amount is $#{loan_amount}, your APR is #{apr}%, and your
    loan duration is #{loan_duration} years. Please type Y if this is correct
    or N if you need to re-enter your information")
    confirmation = gets.chomp
    break if confirmation.downcase.start_with?('y')
  end

  monthly_rate = (apr / 12)
  formatted_monthly_rate = format('%.2f', monthly_rate)
  monthly_rate_decimal = monthly_rate / 100
  monthly_loan_duration = (loan_duration * 12)
  monthly_payment = calculate(loan_amount, monthly_rate_decimal, monthly_loan_duration)
  formatted_monthly_payment = format('%.2f', monthly_payment)
  
  prompt(MESSAGES['breakdown'])
  prompt("Your loan duration is #{monthly_loan_duration} months and your monthly
  interest rate is #{formatted_monthly_rate}% which means your monthly payment
  is $#{formatted_monthly_payment}")
  
  prompt(MESSAGES['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
