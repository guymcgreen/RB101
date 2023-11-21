# what is causing the error on this code? 2 ways to fix?

puts "the value of 40 + 2 is " + (40 + 2)

# error is cause since an integer and a string cannot concatenate

# call .to_s to (40 + 2)
# use string interpolation: "#{(40 + 2)}"
