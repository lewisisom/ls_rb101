# Problem 1
def repeat(string, positive_integer)
  positive_integer.times { puts string }
end
repeat("Hello, World!", 6)

# Problem 2
def is_odd?(integer)
  if integer.odd?
    true
  else
    false
end
p is_odd?(-10)