##### Question 1
# Turn this array into a hash where names are keys
# and values are positions in the array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Initialize an empty hash.
# Initialize a second array.
# Fill the second array with the numbers one through the input array size.
# Pair each of the elements of the second array with the input array,
# and setting that to a new nested array.
# Turn the new nested array into a hash.
# Set that to the empty initialized hash.
# Print out that hash.
# End the program.

flintstones_hash = {}
second_array = (1..flintstones.size).to_a

counter = 0
nested_array = []
loop do
  break if counter >= flintstones.size
  nested_array << [flintstones[counter], second_array[counter]]
  counter +=1
end

flintstones_hash = nested_array.to_h
p flintstones_hash

# OR

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

##### Question 2
# Add up all ages from ages hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Initialize a new array.
# Iterate over every value in ages.
# Shove each value into the new array.
# Destructively sum up the new array.
# Print the integer. End the program.

ages_array = []
ages.each { |key, value| ages_array << value }
ages_array = ages_array.sum
p ages_array

##### Question 3
# Remove people with age 100 or greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Iterate over the input hash.
# Check each value.
# If greater than or equal to 100, destructively remove both
# the key and value there.
# Print the hash. End the program.

ages.each do |k, v|
  if v >= 100
    ages.delete(k)
  end
end
p ages

##### Question 4
# Pick out the minimum age from this hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.min[1]

##### Question 5
# Find the index of first name that starts with "Be":
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |name|
  if name.start_with?("Be")
    p flintstones.index(name)
  end
end

p flintstones.index { |name| name[0, 2] == "Be" }

##### Question 6
# Amend array so names are shortened to only first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |name|
  loop do
    if name.length > 3
      name.chop!
    else
      break
    end
   end
 end
p flintstones

# Or:
# p flintstones.map! { |name| name[0, 3] }

##### Question 7
# Create hash, shows frequency of letter occurrences.
statement = "The Flintstones Rock"

# Initialize a new hash.

# Iterate over every character in the string input.

# Compare the current character to the new hash.

# If current character is already in the new hash,
# add one to the value of the character's key/value pair.

# If current character is not already in the new hash,
# make a new key/value pair with the current character
# being the key, and the value set to one.

# Once it is finished interating over the string input, 
# print the new hash. End the program.

frequency_hash = {}
current_character = ''
counter = -1

statement.split('').each do
  current_character = statement.split('')[counter]
  counter += 1
  if frequency_hash.has_key?("#{current_character}")
    puts "Im run"
    frequency_hash["#{current_character}"] += 1
  else    
    frequency_hash.merge!({current_character=>1})
  end
end

p frequency_hash

##### Question 8
# Modify an array while iterating over it? Output of this?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# 1
# 3
# What about this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# 1
# 2

##### Question 9
# Titleize:
words = "the flintstones rock"
tmp_words = words.split(' ')
tmp_words.each { |word| word.capitalize! }
words = tmp_words.join(' ')
p words

# The official solution is basically just
# condensing my 3 lines into 1 line:

# words.split.map { |word| word.capitalize }.join(' ')
# Nice

##### Quesiton 10
# Modify the hash such that each member of the Munster family has an
# additional "age_group" key that has one of three values describing
# the age group the family member is in (kid, adult, or senior).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"} }

=begin
munsters["Herman"]["age_group"] = "adult"
munsters["Lily"]["age_group"] = "adult"
munsters["Grandpa"]["age_group"] = "senior"
munsters["Eddie"]["age_group"] = "kid"
munsters["Marilyn"]["age_group"] = "adult"
=end

munsters.each do |name, details|
  case details["age"]
  when 0..17
    details["age_group"] = "kid"
  when 18..64
    details["age_group"] = "adult"
  when (65..)
    details["age_group"] = "senior"
  else
    p "An error has occured!"
  end
end

p munsters

# 