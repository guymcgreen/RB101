# what is the difference?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Both methods have the same return value. However, the first implementation returns a reference to the object passed in as the buffer argument, while the second returns a new object. Furthermore, the first implementation mutates the argument given by the buffer argument, while the second does not mutate its input_array argument. That is, the code that calls rolling_buffer1 will see a modified array after the method returns, while the code that calls rolling_buffer2 will not see any changes in the array.

# It's also worth noting that Alyssa's first solution both returns a meaningful value and has a side effect. As we learned earlier, that's something we should avoid. Thus, the second solution is probably the better of the two.