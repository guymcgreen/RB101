# write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

=begin 
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }