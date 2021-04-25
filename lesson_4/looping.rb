arr = [1, 2, 3, 4, 5]
count = 0
loop do
  break if count >= arr.length
  arr[count] += 1
  count += 1
end
p arr

loop do
  number = rand(1..10)
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end

# Okay, cool, I basically already udnerstand all of this stuff.
# Iterating loop of string's characters:
# Let's get rid of spaces too!
epic_string = "I am very smart"
new_epic_string = epic_string.split.join
counter = 0
loop do
  break if counter >= new_epic_string.length
  puts new_epic_string[counter]
  counter += 1
end

# What will that code print? (Array iteration example)
# I'm the color green!
# I'm the color blue!
# I'm the color purple!
# I'm the color orange!
