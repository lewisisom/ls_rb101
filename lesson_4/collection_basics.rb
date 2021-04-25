# How to reference "grass" in this:
str = 'The grass is green'
str[4, 5] # Normal solution
str.split[1] # I am very smart solution

# What will be returned here?
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
p arr[2, 3]
p arr[2, 3][0]
# -- GUESS #1:
# c
# d
# e
# c
# -- GUESS #2:
# ["c", "d", "e"]
# [
# -- SOLUTION:
# ["c", "d", "e"]
# "c"

# IMPORTANT NOTE
# arr = ["hi", 2]
# arr.slice(0, 1)
# arr.slice(0)
# THESE ARE DIFFERENT.

# Try this code:
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
# You get a warning, instead of a straight-up error.
# "warning: key 'fruit' is duplicated and overwritten on line x"

# What returns?
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']
p str[-6] # nil
p arr[-6] # nil
p arr[5] # nil
# Both returns nil if index is out of range.
# arr.fetch(-6)

example_hash = { "test" => "bad", :test => nil }
p example_hash[:test]
p example_hash["jargon"]
p example_hash["test"]
if example_hash[:test] == example_hash["jargon"]
  puts "yup"
end
example_hash.fetch(:test)
example_hash.fetch("test")
# example_hash.fetch("jargon")

p arr.join

str = 'How do you get to Carnegie Hall?'
p arr = str.split
p arr.join(" ")

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
p arr.to_h # {:name=>"Joe", :age=>10, :favorite_color=>"blue"}

p "~~~~~~~~~~~~~~~~~~~~~~~"
str = "joe's favorite color is blue"
str[0] = 'J'
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
p str

arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
p arr

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
p hsh
hsh[:new_thing] = "test"
p hsh
