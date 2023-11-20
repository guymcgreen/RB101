flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# will end up like

flintsones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

p flintsones.flatten! # used to make unnested arrays

