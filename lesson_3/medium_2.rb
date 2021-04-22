# Question 1 - How will values and objects ids change through this?
# First, four variables are assigned.
# Then, four more variables are assigned to the first four variables' object ids.
# Puts all eight variables.
# Assigns four more variables.
# Puts the newest eight variables.
# Reassignes the initial four variables.
# The following puts statements are in fact correct.
# Line 45, d_inner = c_inner[0] is the same as d_inner = 44
# Then, the *_inner_id four variables get updated to match the object id of their updated, older, cousins.
# The three following sets of four puts statements are all correct statements.
# The four rescue at the end are not used (so it will not put out "ugh ohhhhh").

# Question 2 - Changed to a method. What's the difference?
# I copied and edited to make this:
# Study this code-
def fun_with_ids
  a_outer = 42
  a_outer_id = a_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, a_outer_id)

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
  end

  def an_illustrative_method(a_outer, a_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts

  a_outer = 22

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts

  a_inner = a_outer
  a_inner_id = a_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts
end

fun_with_ids

# Question 3 - What will be displayed and why?
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins", "rutabaga"]
# More testing and trying to figure things out:

def tricky_method(new_string, an_array_param)
  new_string += "rutabaga"
  an_array_param << "rutabaga"
end

def tricky_method_v2(new_string, an_array_param)
  new_string << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]

puts my_string.object_id
puts my_array.object_id

tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

tricky_method_v2(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts my_string.object_id
puts my_array.object_id

# Question 4 - We changed question 3- What's the difference now?
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins"]
# The tables really have turned- The string is now modified but 
# the array is not. Changed the operators between << (mutating)
# and = (non-mutating).

# Quesiton 5 - Change the code so it's easier to understand:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6 - Remove unncecessary duplication:
def color_valid1(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid2(color)
  colors = ["blue", "green"]
  colors.include?(color)
end

puts color_valid1("g")
puts color_valid2("g")

# That's what I came up with ^^^
# And this is the official solution:

def color_valid3(color)
  color == "blue" || color == "green"
end

puts color_valid3("g")