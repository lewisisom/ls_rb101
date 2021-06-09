# Will delete and combine this file into another soon

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
# - 

def on_lights(num)
	on_lights = []
	lights_array = Array.new(num, false)

	num.times { |i| p i}

end

# Test Cases

p on_lights(5) == [1, 4]
p on_lights(10) #== [1, 4, 9]
p on_lights(3) #== [1]
p on_lights(4) #== [1, 4]
