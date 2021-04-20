# Question 1 - Is 'spot' present?
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?('spot')
p ages.any?('spot')
p ages.has_key?('spot')
p ages.member?('spot')
p ages.key?('spot')

# Question 2 - Convert string in certain ways:
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase # Initally could only do p munsters_description.upcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Question 3 - Add key/value to existing hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Question 4 - Does it appear in the string?
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.split(' ').include?('Dino')
p advice

# Question 5 - Easier way to write array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 6 - Add to easier-to-write array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
p flintstones

# Question 7 - Now, add multiple items to array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
# flintstones.concat(%w(Dino Hoppy)) <--- Works as well
p flintstones

# Question 8 - Shorten / cut this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.delete_suffix!('house training your pet dinosaur.')
p advice
# That technically works, but there's definitely somthing simplier
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ") # Huh???
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))
p advice

# Question 9 - One-liner that counts specific characters:
statement = "The Flintstones Rock!"
p statement.count('t')

# Question 10 - Center text without CSS:
title = "Flintstone Family Members"
p title.center(40)
