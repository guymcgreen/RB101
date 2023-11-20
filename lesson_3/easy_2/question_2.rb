# make is so munsters_description prints in the following ways:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."


munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase!

p munsters_description.downcase!.capitalize!

p munsters_description.downcase!

p munsters_description.upcase!