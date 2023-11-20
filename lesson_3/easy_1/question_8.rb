# Create an array containing only two elements: Barney's name and Barney's number.


flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p barney_array = ["Barney", flintstones["Barney"]]

# or a much more elegant way is

p barney_array1 = flintstones.assoc("Barney")