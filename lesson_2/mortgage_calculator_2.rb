require 'yaml'

def load_messages(file_path)
  YAML.load_file(file_path)
end

def prompt(messages, message_key, additional_text = '')
  puts "=> #{messages[message_key]} #{additional_text}"
end

def valid_number?(num)
  /^\d+(\.\d*)?$/.match(num)
end

def get_valid_input(messages, message_key, type=:float)
  loop do
    prompt(messages, message_key)
    input = gets.chomp
    if valid_number?(input) && input.to_f > 0
      return type == :float ? input.to_f : input.to_i
    else
      prompt(messages, 'invalid_number')
    end
  end
end

def calculate_monthly_payment(loan_amount, monthly_rate_decimal, loan_duration_months)
  loan_amount * (monthly_rate_decimal / (1 - (1 + monthly_rate_decimal)**(-loan_duration_months)))
end

def get_user_confirmation(messages, loan_amount, apr, loan_duration)
  prompt(messages, 'confirm', "Your loan amount is $#{loan_amount}, your APR is #{apr}%, and your loan duration is #{loan_duration} years. Please type Y if this is correct or N if you need to re-enter your information")
  confirmation = gets.chomp
  confirmation.downcase.start_with?('y')
end

def main
  messages = load_messages('mortgage_calculator_messages.yml')

  prompt(messages, 'welcome_message')

  name = get_user_name(messages)
  prompt(messages, 'greeting', "Nice to meet you #{name}, I'm going to ask for a few bits of information and provide your mortgage loan monthly breakdown for you.")

  calculate_and_display_payments(messages)
  
  prompt(messages, 'goodbye')
end

def get_user_name(messages)
  loop do
    name = gets.chomp
    return name unless name.empty?
    prompt(messages, 'invalid_name')
  end
end

def calculate_and_display_payments(messages)
  loop do
    loan_amount, apr, loan_duration = get_loan_details(messages)

    if get_user_confirmation(messages, loan_amount, apr, loan_duration)
      formatted_monthly_rate, monthly_loan_duration, formatted_monthly_payment = compute_loan_details(loan_amount, apr, loan_duration)
      prompt(messages, 'breakdown', "Your loan duration is #{monthly_loan_duration} months and your monthly interest rate is #{formatted_monthly_rate}% which means your monthly payment is $#{formatted_monthly_payment}")
      break unless ask_to_continue(messages)
    end
  end
end

def get_loan_details(messages)
  loan_amount = get_valid_input(messages, 'loan_amount')
  apr = get_valid_input(messages, 'apr')
  loan_duration = get_valid_input(messages, 'loan_duration', :int)
  [loan_amount, apr, loan_duration]
end

def compute_loan_details(loan_amount, apr, loan_duration)
  monthly_rate = (apr / 12)
  formatted_monthly_rate = format('%.2f', monthly_rate)
  monthly_rate_decimal = monthly_rate / 100
  monthly_loan_duration = (loan_duration * 12)
  monthly_payment = calculate_monthly_payment(loan_amount, monthly_rate_decimal, monthly_loan_duration)
  formatted_monthly_payment = format('%.2f', monthly_payment)
  [formatted_monthly_rate, monthly_loan_duration, formatted_monthly_payment]
end

def ask_to_continue(messages)
  prompt(messages, 'again')
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

main