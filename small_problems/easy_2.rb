=begin

# Problem 1
puts "Teddy is #{rand(20..200)} years old!"

# Problem 2
SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f
puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f

area = (length * width).round(3)
area_in_feet = (area * SQMETERS_TO_SQFEET).round(3)

puts  "The area of the room is #{area} square meters " \
      "(#{area_in_feet} square feet)."

# Problem 3
print 'What is the bill? '
bill = gets.chomp.to_f
print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f

tip = (bill * (tip_percent / 100)).round(2)
total = (bill * (1 + tip_percent / 100)).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# Problem 4
print "What is your age? "
current_age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retire_age - current_age
retirement_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"

# Problem 5
print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# Problem 6
50.times{|i|p i*2+1}
100.times { |num| p num if num.odd? }

# Problem 7
(1..49).map{|i|p i*2}
puts (1..99).select(&:even?)

# Problem 8
def valid_inputs?(int, str)
  int.positive? && (str == 'p' || str == 's')
end

def sum(int)
  (1..int).sum
end

def product(int)
  (1..int).inject(:*)
end

operator = nil
number = nil

loop do
  puts '>> Please enter an integer greater than 0:'
  number = gets.chomp.to_i
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operator = gets.chomp

  break if valid_inputs?(number, operator)

  puts 'Please enter a valid number and operator. Ensure there are no spaces.'
end

if operator == 's'
  puts "The sum of the integers between 1 and #{number} is #{sum(number)}."
else
  puts "The product of the integers between 1 and #{number} is #{product(number)}."
end

# Problem 9
# BOB
# BOB

# Problem 10
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# array2's strings has the same object id's as array1 does.
