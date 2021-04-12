# What is 3 + 5 * 7 ??
# 3 + 5 * 7 --> 3 + 35 --> 38
# 3 + (5 * 7) => 38
# (3 + 5) * 7 => 56
# Use paranetheses to be unambiguous.

def value(n)
  puts n
  n
end
puts value(3) + value(5) * value(7)

a = b = c = 3
puts a if a == b if a == c

p '~~~~~~~~~~'

false ? 1 / 0 : 1 + 2  # raises error ZeroDivisionError
false && 1 / 0         # raises error ZeroDivisionError
true || 1 / 0       # raises error ZeroDivisionError

p '~~~~~~~~~~'

array = [1, 2, 3]

p array.map { |num| num + 1 }     # => [2, 3, 4]

p '~~~~~~~~~~'

p  (array.map do |num|
    num + 1
  end)                                #   => [2, 3, 4]

p '~~~~~~~~~~'

p array.map

# .tap is an exteremely useful debugging tool!

p '~~~~~~~~~~'

mapped_array = array.map { |num| num + 1 }

mapped_array.tap { |value| p value }              # => [2, 3, 4]

# basically, use parantheses to ensure proper precendecne.
# It can be confusing for sure.

# remebmber to push to github periodically also