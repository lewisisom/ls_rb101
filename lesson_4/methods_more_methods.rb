# Question 1
# Return value? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# [1, 2, 3]
# Select is a 'filter-ive' method, which tests each element
# and if the block returns true, it it shoved into a seperate array.
# If the block returns false, it does not add the element, and
# simply continues iterating. The returned array will always be 
# either smaller or the same size as the original input.
# Since 'hi' is truthy, the block will always return true.
# All elements will be added, returning [1, 2, 3].

# Question 2
# How does count treat the block's return value? How to know?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# 1
# It basically increments an integer by 1 if the block
# returns true. Since the only time the block returns true
# is when it gets to 'caterpillar', it only adds 1 once.

# Question 3
# Return value? Why?
[1, 2, 3].reject do |num|
  puts num
end
# [1, 2, 3]
# Reject here returns all of the elements from the original
# array, or in other words, just the original input array.
# On each iteration, reject puts the element into a new array
# if the block returns a falsey value (false or nil). Since
# puts always returns nil, every element will be added.

# Quesiton 4
# Return value? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# {}
# I am confused at this code right now. I know that it's not
# going to return the original input, it's going to return a
# hash with stuff in it.
# {"a"="ant", "b"=>"bear", "c"=>"cat"}

# Quesiton 5
# What does shift do? How to know?
hash = { a: 'ant', b: 'bear' }
hash.shift
# [:a, "ant"]
# Look at the Ruby docs, you'll see that shift destructively removes the 
# first element of a hash and returns an array of the key and value removed.

# Question 6
# Return value? Why?
['ant', 'bear', 'caterpillar'].pop.size
# 11
# When you call pop, it always just returns one element. The element
# you removed. When size is called on pop, assuming that pop was called
# on a non-empty array, it will return a single integer. Pop returns
# 'caterpillar'. Size called on a string returns an integer of how
# many characters there are in the string. 'caterpillar' has 11 characters.

# Question 7
# Block return value? How determined? Also, any? return value? What output?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# [true, false, true]
# Evaluate the final line of the block using each element. Put the
# results into an array. [true, false, true] is the block's return value.
# true
# The any? method only returns a single boolean- true, false. Since
# atleast one of the iterations of the block returned true, any? will
# return true.
# 1
# The only thing printed to the screen will be the first element, 1.
# After any? finds out that 1 returns true, it doesn't need to keep going.

# Quesiton 8
# Take workings? Destructive? How to know?
arr = [1, 2, 3, 4, 5]
arr.take(2)
# Take returns a new array containing the first x elements
# of the original array, where x is the argument in (), ex: (2).
# Take is not destructive. Look at the Ruby docs, in Class: Array 3.0.0
# and search for the take method. It explicitly states 'does not modify self'.

# Question 9
# Return value of map? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# [nil, "bear"]
# The map method makes a new array and puts in every return value
# of each iteration of the block. Map is non-destructive. The returned
# array from map always has the same elements as the original input,
# so any element without a return value will be set to nil.
# Input is enumerable, output is array.

# Question 10
# Return value of this code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# [1, nil, nil]
# Map is being used. Map always returns a new array with the same number
# of elements as the input. Here, the block returns 1 for the first element,
# and returns nil for the second and third elements (because puts returns nil).
# Since this is all there is in this code, the overall return value is [1, nil, nil]
