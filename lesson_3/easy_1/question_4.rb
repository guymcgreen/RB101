# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# how do these two methods differ?

puts numbers.delete_at(1) # will delete at index 1
puts numbers.delete(1) # will delete the integer 1
p numbers # => [3, 4, 5]
# note both of these, the array is operated on direction and the return value is the value that was removed!
