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

def minilang(instruction)
  stack = []
  register = 0
  tokens = instruction.split

  tokens.each do |token|
    case token
    when 'PUSH' then stack.push(register)
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register 
    else register = token.to_i
    end
  end
end

#minilang('5 PUSH 12 ADD PRINT')
# 17
#minilang('PRINT')
# 0
#minilang('-3 PUSH 5 SUB PRINT')
# 8
#minilang('3 PUSH PUSH 7 DIV MULT PRINT')
# 6
#minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# Medium 1 Problem # 7 Word to Digit

NUMBERS = { 'zero': '0', 'one': '1', 'two': '2', 'three': '3', 'four': '4',
           'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9'}

def word_to_digit(words)
  NUMBERS.keys.each do |word|
    words.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Medium 1 Problem # 8 Fibonacci Numbers (Recursion)

FIB_CHEAT_CODE = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

def fibonacci(num)
  FIB_CHEAT_CODE[num]
end
# ^^^^ works perfectly fine as long as num is max 12 ^^^

def e_fibonacci(num)
  return 0 if num <= 0
  sequence = [0, 1] if num >= 1
  (num - 1).times do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence[num]
end

def fibonacci(num)
  sequence = [0, 1]
  (num - 1).times { sequence << sequence[-1] + sequence[-2] }
  sequence[num]
end

# 0 1 2 3 4 5 6 7  8  9  10 11 12
# 0 1 1 2 3 5 8 13 21 34 55 89 144
p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(200_000)

# Execpt I didn't even use recursion...
# Here is another solution, but actually trying recursion:

def fibonacci(num)
  return num if num <= 1
  fibonacci(num-1) + fibonacci(num-2)
end

p fibonacci(0) == 0
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Medium 1 Problem # 10 Fibonacci Last Digit

# - return the last digit of the nth fibonacci number,
# basically the same as the previous exercise, except
# we only want the final digit.

# input: any positive integer
# output: a new integer of length one

# - lets make a temp solution just stealing the
# previous exercises solution

def old_fibonacci_last(num)
  sequence = [0, 1]
  (num - 1).times { sequence << sequence[-1] + sequence[-2] }
  sequence[num].to_s[-1].to_i
end

# - 
# 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
# 0 1 1 2 3 5 8 3 1 4 5  9  4  3  7  0  7  7  4  1  5  6  1  7  8  5  3  8  1
# 

# - our goal is to make extremely large values of num
# execute almost instantly. 123 million should work fine.

def old_fibonacci_last(num)
  num %= 60
  sequence = [0, 1]
  2.upto(num) { sequence = [sequence.last, sequence.sum % 10] }
  sequence.last
end

def fibonacci_last(num)
  '011235831459437077415617853819099875279651673033695493257291'[num%60]
end

p fibonacci_last(15) # 0
p fibonacci_last(100) # 5
p fibonacci_last(100_001) # 1
p fibonacci_last(123456789) # 4

p fibonacci_last(60)
p fibonacci_last(240)

p fibonacci_last(12347)
p fibonacci_last(47)

p fibonacci_last(123456789987745) # 5

p fibonacci_last(100000000000000004568797654325678965430000000)
p fibonacci_last(99999999)

# Done with Medium 1 Problems

=end

# Going back to Diamonds! (Problem 5)

