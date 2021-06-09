# Will delete and combine this file into another soon

=begin

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

=end

# Medium 1 Problem # 6 Stack Machine Interpretation

# 
