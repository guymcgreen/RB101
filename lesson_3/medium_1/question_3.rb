# alter method to rescue if number is 0 or negative

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def find_factors(number)
  if number <= 0
    puts "Please provide a positive number"
    return []
  end
  
  divisor = number
  factors = []
  
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p find_factors -3