# How could the following method be simplified without changing its return value?

def color_valid(color)
  color == "blue" || color == "green" ? true : false
end

p color_valid("blue")

# or

def color_valid(color)
  color == "blue" || color == "green"
end