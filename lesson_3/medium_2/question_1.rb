a = "forty two"
b = "forty two"
c = a

puts a.object_id 
puts b.object_id
puts c.object_id

# predict the relationship of the object ids that are outputted
# a and c will have the same object id and b will have a different id

# the object ids show that a and c reference the same object. This is because c was initialized to the object referenced by a. No surprises here.


