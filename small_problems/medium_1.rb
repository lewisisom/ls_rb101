=begin

# Problem 1 - Method that rotates an array- move the first element to the end:
def rotate_array(array)
  array[1..] << array[0]
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]
x == [1, 2, 3, 4]

def rotate_string(string)
  string[1..] << string[0]
end

something = 'hello'
rotate_string(something)
something

def rotate_number(number)
  number.to_s[1..] << number.to_s[0]
end
def rotate_integer(number)
  number.to_s[1..] << number.to_s[0]
end
def rotate_float(number)
  number.to_s[1..] << number.to_s[0]
end

number = 1234.6765
number
rotate_number(number)
number

def rotate_hash(hash)
  (hash.to_a[1..] << hash.to_a[0]).to_h
end

rotate_hash({ key1: 'value1', key2: 'value2', key3: 'value3'})

def rotate(object)
  return object[1..] << object[0] if object.class == Array || object.class == String
  return (object.to_s[1..] << object.to_s[0]).to_ if object.class == Integer || object.class == Float
  return (object.to_a[1..] << object.to_a[0]).to_h if object.class == Hash
  p 'An error has occured.'
end

p rotate(5.66)

# Problem 2 - Method that rotates last n digits of a number:
def rotate_rightmost_digits(number, digits)
  non_rotating = number.to_s.chars[0..((-digits)-1)]
  rotating = number.to_s.chars[-digits..-1]
  rotating = rotating[1..] << rotating[0]
  (non_rotating + rotating).join.to_i
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917

# Problem 3 - Return the "max rotation" of a series of digits:

def max_rotation(num)
  result = num.to_s.chars
  counter = 0

  until counter >= num.to_s.size
    result[counter..-1] = result[counter - 1..] << result[counter]
    counter += 1
  end

  result.join.to_i
end

p max_rotation(735291) #== 321579

# wow

# Medium #1 Exercise 1000 Lights
##########

# Understanding the Problem

# input: any positive integer
# output: a new array, containing integers

# rules-
# the input integer is how many cycles of this happens,
# aka, x = 5 would have 5 light toggling passes.
# there will always be x lights, and they start all off
# we can represent a specfic light's state with a boolean
# The light toggling repitions go in a pattern, toggling:
# 1st: 1, 2, 4, 5, 6...
# 2nd: 2, 4, 6...
# 3rd: 3, 6...
# 4th: 4...
# 5th: 5...
# and so on
# we are going to write a ruby method here

# 0 0 0
# 1 1 1
# 1 0 1
# 1 0 0 - final lights state
# the returning array would be [1]

# 4 lights
# 0 0 0 0 - initial
# 1 1 1 1 - 1st every light
# 1 0 1 0 - 2nd every 2, 4, 6, 8
# 1 0 0 0 - 3rd every 3, 6, 9,
# 1 0 0 1 - 4th, final lights state
# the returning array would be [1, 4]

# Algorithm
# - initialize a new array named on_lights, assigned to
# an empty array
# - initialize another new array named lights_array,
# assigned to an array with all false values, the size
# of x (if 3 is input, this will be [false, false, false])
# - huh, what's next?
# - iterate through lights_array, and add the index of
# anything that is true. Do not add the index number for
# light that are off (false)
# is light #1 on? then add the integer 1 to on_lights
# is light #2 on? then add the integer 2 to on_lights, etc.
# Hmmmm
# lights_array lights 1, 2, 3, 4 flip boolean]
# lights_array lights 2, 4 flip boolean
# lights_array lights 3 flip boolean
# lights_array lights 4 flip boolean

def toggle_lights(num, lights_array)
  num.times do |iteration|
    num.times do |index|
      if ((index + 1) % (iteration + 1)).zero?
        lights_array[index] = !lights_array[index]
      end
    end
  end
end

def on_lights(num)
  on_lights = []
  lights_array = Array.new(num, false)

  toggle_lights(num, lights_array)

  num.times do |index|
    on_lights << index + 1 if lights_array[index] == true
  end

  on_lights
end

# Test Cases

p on_lights(5) == [1, 4]
p on_lights(10) == [1, 4, 9]
p on_lights(3) == [1]
p on_lights(4) == [1, 4]
p on_lights(1000) ==  [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169] +
                      [196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576] +
                      [625, 676, 729, 784, 841, 900, 961]

# Medium 1 Problem #5 Diamonds!

# Understand the Problem

# input: any positive odd integer
# output: display symbols on multiple lines
# to create an image

# input number x will always be odd and positive
# the display grid will be x by x characters, so
# x lines and x columns in each line
# the symbol in each character spot will either be
# a space ( ) or a star (*).

# Algorithm
# - initialize a layered array with x subarrays
# and x items in each subarray, and all having
# the initial value of the string ' ', named grid
# - initialize varibale middle to equal half of x
# - set positions to stars based on the subarray
# and initial value x, specifially, set the middle
# position of the first subarray as well as the
# final subarray to a star then the
# 3 middle values on the second row to a star, and so on
# until you've done half of x + 1 rows
# display grid to the screen, program done
# I found the original plan of pre-putting in spaces
# actually does not work, or atleast I coudnt get it 
# to work

# New Algorithm
# - Initialize an array named grid with...
# - I'm still lost
# - Display the grid array

# Code

def diamond(size)
  puts ' * '
  puts '***'
  puts ' * '
end

# Test Cases

#diamond(1)
diamond(3)
#diamond(9)
#diamond(17)

# MOVING ON TO ANOTHER PROBLEM, I CANNOT FIGURE
# THIS ONE AT ALL EVEN AFTER LOOKING AT THE
# SOLUTION AND EXPLANATION

# Medium 1 Problem # 6 Stack Machine Interpretation

# Understanding the Problem

# Algorithm

# Code

def minilang(instruction)
  p instrution
end

=end
