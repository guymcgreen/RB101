numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin I expect this code to print out 1 2 2 3 since the .uniq method is not
destructive (puts won't print the array since it loses that data formatting -- 
use p if you want to print [1, 2, 2, 3])
=end