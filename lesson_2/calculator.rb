# frozen_string_literal: true

# ask the user for two numbers
# ask the uswer for an operation to perform
# perform the operation on the two numbers
# output the result

require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_f.to_s == num.to_s
end

def operation_to_message(op)
  word = case op # saving the return value of case statement as a variable so we can add to last line of code, if we wanted to add something after the case statement)
          when '1'
            'Adding'
          when '2'
           'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
          
  word
end

prompt(MESSAGES['welcome_message'])

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt(MESSAGES{'valid_name_prompt'})
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number_prompt'])
    number1 = Kernel.gets().chomp().to_f()
    
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
  
  number2 = ''
  loop do
    prompt(MESSAGES['second_number_prompt'])
    number2 = Kernel.gets().chomp().to_f()
    
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  
  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose, 1, 2, 3 or 4")
    end
  end
  
  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2
           end
  
  prompt("The result is #{result}!")
  
  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator! See you #{name}!")
