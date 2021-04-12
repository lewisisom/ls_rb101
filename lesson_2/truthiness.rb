num = 2
p (num > 2).class
# FalseClass

p num == 2 && num.even?
# true

p num.even? && # true
num == 2 && # true
num < 3 && # true
num == num * 2 && # false
num + num == num ** 2 # true
# false

p 2 == 3 || 3 == 4 || 3 == 3 || 4 == 5
# true
# This example will short circuit. After it evaluates 3 == 3 (false),
# it does not need to keep going. It does not even look at 4 == 5
# before giving the output.

# Compare:
p true || 5/0 # true - this is another example of short circuiting.
p true && 5/0 # Error: divided by 0

# Literally everything that isn't false or nil is truthy/has truthiness/
# give out truth.