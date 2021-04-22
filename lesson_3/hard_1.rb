# Question 1 - What will happen
# Undefined local variable 'greeting'
=begin

if false
  greeting = "hello world"
end
puts "yup" if greeting == nil
puts "yup" if new_stuff == nil

=end
# Wow that's pretty interesting.
# The computer still looks at that line in the loop 
# even though it will never be executed.

# Question 2 - Last line result
# {:a=>"hi there"}
# This is my prediction. [Edit: Perfectly correct]
# The second line binds informal_greeting to part of the greetings hash.
# Any mutating stuff done to an object that's binded to any part of
# another object will also mutate the other thing.
# Tip: using .clone to assign a thing to another thing does NOT bind them.
# Tip: using only non-mutating stuff like = instead of << will not 
# change the other object its binded to.

# Question 3 - What will be printed
# ~ Code group A) ~ ### NO, = IS NON-MUTATING. NOTHING CHANGES
# one is: two
# two is: three
# three is: two
# ~ Code group B) ~ ### NO, = IS NON-MUTATING. NOTHING CHANGES
# one is: two
# two is: three
# three is: one
# ~ Code group C) ~ # Yes, correct
# one is: two
# two is: three
# three is: one

# Quesiton 4 - Fix the code:

def dot_separated_ip_address_v1(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

def dot_separated_ip_address_v2(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    return false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    true
  end
end

def is_an_ip_number?(input)
  input.to_i.bit_length <= 8
end

puts dot_separated_ip_address_v1("3.5.567.2")
puts dot_separated_ip_address_v2("3.5.567.2")
puts dot_separated_ip_address_v1("36.5.3.11.0")
puts dot_separated_ip_address_v2("36.5.3.11.0")
puts dot_separated_ip_address_v1("2.13.110.7")
puts dot_separated_ip_address_v2("2.13.110.7")

# EPIC It works, I am happy.