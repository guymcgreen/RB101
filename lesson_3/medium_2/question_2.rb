a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# predict the relationship of the object ids that are outputted

# all will have the same object ids since integers are immutable
# this is the same for true, false and nil are also handled specially (eg, every instance of true will all have the same object id). This also has to do with the immutability of true, false and nil.
