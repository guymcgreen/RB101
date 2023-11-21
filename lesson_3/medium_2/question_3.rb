def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

# what will be displayed and why?

# String_arg_one: "pumpkins" (+ does not mutate)
# String_arg_two: "pumpkinsrutabaga" (<< does mutate)
# In both cases, Ruby passes the arguments "by value", but unlike some other languages, the value that gets passed is a reference to some object. The string arguments are passed to the method as references to objects of type String.

# The important distinction is that while a reference is passed, the method initializes new local variables for both strings and assigns each reference to the new local variables. These are variables that only live within the scope of the method definition.

# So, if both arguments live inside the method as new variables that store a reference to the passed objects...why don't the strings behave the same way in our output?

# The difference lies in what Ruby does when the program executes either a String#+= operation or a String#<< operation.

# The String#+= operation is re-assignment and creates a new String object. The reference to this new object is assigned to string_param_one. The local variable string_param_one now points to "pumpkinsrutabaga", not "pumpkins". It has been re-assigned by the String#+= operation. This means that string_param_one and string_arg_one no longer point to the same object.

# On the other hand, String#<< mutates the calling object. Therefore, string_param_two << "rutabaga" mutates the object referenced by string_param_two, so that it becomes "pumpkinsrutabuga". So, because the local variable string_param_two still points to the original object, the local variables string_arg_two and string_param_two are still pointing at the same object, and we see the results of what happened to the array "outside" of the method.

