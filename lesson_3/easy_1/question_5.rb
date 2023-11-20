# Programmatically determine if 42 lies between 10 and 100.

def does_number_fall_between?(num)
  if (10..100).include?(num)
    puts "Yes, #{num} lies between 10 and 100"
  else
    puts "No, #{num} does not lie between 10 and 100"
  end
end

does_number_fall_between?(42)

# or 

puts (10..100).cover?(42)

# cover? avoids having to iterate over the entire sequence of numbers!
