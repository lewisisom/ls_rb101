# Example 1

a = "Hello"
b = a
a = "Goodbye"
puts a
puts b

# Return? Output? Why? Concept?

# On line 3, variable `a` is initialized to string
# object "Hello", and then variable `b` is intialized
# to the value of a, which is the string "Hello".
# On the next line, line 5, variable `a` is reassigned
# to the string object "Goodbye", however, what's
# important here, is that the variable `b` does not
# get updated to the new value of variable `a`, so
# variable `b` is still assigned to the string object
# "Hello". On the next two lines, lines 6 and 7, we
# call the `puts` method and pass in the variables
# `a` and `b` respectively as the method's arguments.
# This will print out to the console "Goodbye" first,
# and then, on a seperate line, "Hello".
# Both `puts` calls return nil.
# The concept being demonstrated here is that variable
# reassignment creates a new object. The '=' operator
# is non-mutating, so a new string object is created
# when variable `a` is reassigned on line 5. At this
# point, variables `a` and `b` no longer point to
# the same place in memory.

# Example 2

# Return? Output? Why? Concept?

a = 4

loop do
  a = 5
  b = 3

  break
end

puts a
puts b

# On line 38, the local variable `a` is initialized to
# the integer object `4`. The `do...end` in front of
# the `loop` method creates a block on lines 37-42,
# and inside of which, the variable `a` is reassigned
# to the integer 5, but more importantly, on the next
# line, line 39, the local variable `b` is initialized
# to the integer 3, which demonstrates an important
# concept: variable initialization can occur within
# a block. Continuing on, the `break` statement exits
# the loop, the `puts` method is called, with (the
# variable `a` passed in, which will print out 5
# and return nil. On the final line, the `puts` method
# is called again, with variable `b` passed in,
# printing out 3 on a seperate line and returning nil.
# The reason an exception is not raised on line 40
# is because variable initialization is possible within
# a block.

# Example 3

# Return? Output? Why?

