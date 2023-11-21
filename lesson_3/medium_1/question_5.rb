# what is wrong with the below code?

limit = 15

def fib(first_num, second_num, limit) # need to include limit as an argument
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit) # need to pass limit as an argument
puts "result is #{result}"