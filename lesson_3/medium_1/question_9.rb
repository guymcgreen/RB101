# consider

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# what will the following return?

p bar(foo)

# will return 'no'
