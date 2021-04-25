# I already did Loops 1 and Loops 2 before, so this is just a quick review:

### Modify so it's not infinite:
loop do
  puts 'Just keep printing...'
  break
end

### Stop after first iteration:
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

### Iterate 5 times instead of once:
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

### Modify so loop stops once user inputs 'yes':
loop do
  puts "Should I stop looping? (Type 'yes')"
  answer = gets.chomp
  break if answer == 'yes'
end

### Print "Hello!" 5 times:
say_hello = true
hello_counter = 0

while say_hello
  puts 'Hello!'
  hello_counter += 1
  say_hello = false if hello_counter == 5
end

### Print 5 random numbers between 0 and 99:
numbers = []

while numbers.length < 5
  numbers << rand(0..99)
end

puts numbers

### Count from 1-10 instead of 10-1:
count = 1

until count > 10
  puts count
  count += 1
end

### Use until loop to print each number:
numbers = [7, 9, 13, 25, 18]
counter = 0

until counter == numbers.length
  puts numbers[counter]
  counter += 1
end

### Only outputs i if i is odd:
for i in 1..100
  puts i if i.odd?
end

### Greet each friend individually:
friends = ['Sarah', 'John', 'Hannah', 'Dave']
for friend in friends
  puts "Hello, #{friend}!"
end

### Loop that prints 1-5 and says if they're odd or even:
count = 1

loop do
  p "#{count} is odd!" if count.odd?
  p "#{count} is even!" if count.even?
  break if count == 5
  count += 1
end

### Stops if number if between 0 and 10 inclusive:
loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end
# OR
loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

### Using if/else, print if processed or not:
process_the_loop = [true, false].sample
loop do
  if process_the_loop
    puts "The loop was processed!"
  else
    puts "The loop wasn't processed!"
  end
  break
end

### "That's correct!" if user's answer equals 4:
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer.to_i == 4
    puts "That's correct!"
    break
  end
    
  puts 'Wrong answer. Try again!'
end

### User's input gets added to numbers array. Stop when 5 nums:
numbers = []

loop do
  puts "Enter any number (#{numbers.length} out of 5 numbers entered):"
  input = gets.chomp.to_i
  numbers << input
  if numbers.length >= 5
    puts "All done! Here are your five numbers:"
    break
  end
end

puts numbers

### Use loop to remove and print each name. Stop when empty:
names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
  puts names.pop
  break if names.empty?
end
p names

### Prints current number and stops once it equals 2:
5.times do |index|
  puts index
  break if index >= 2
end

### Using next, only print evens:
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

### Two random incrementers, break once either equals 5:
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a >= 5 || number_b >= 5

  puts "5 was reached!"
  break
end

### While loop, print "Hello!" twice:
def greeting(count)
  while count > 0
  puts 'Hello!'
  count -= 1
  end
end

number_of_greetings = 2
greeting(number_of_greetings)

### DONE