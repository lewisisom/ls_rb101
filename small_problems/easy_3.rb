# Problem 1

numbers = []

5.times do |n|
  puts "==> Enter number #{n + 1} out of 5:"
  numbers << gets.chomp.to_i
end

puts '==> Enter the last number:'
key = gets.chomp.to_i

if numbers.include?(key)
  puts "The number #{key} appears in #{numbers}."
else
  puts "The number #{key} does not appear in #{numbers}."
end

# Problem 2
ops = ['+', '-', '*', '/', '%', '**']

puts '==> Enter the first number:'
num1 = gets.chomp.to_i
puts '==> Enter the second number:'
num2 = gets.chomp.to_i

ops.each { |op| puts "==> #{num1} #{op} #{num2} = #{num1.send(op, num2)}" }

# Problem 3
puts "Please write word or multiple words:"
input = gets.chomp
chars = input.delete(' ').size
puts "There are #{chars} characters in \"#{input}\"."

# Problem 4
m=->x,y{x*y}
m[5,3]

def m x,y;x*y end
m 5,3

def multiply(x, y) x * y end
multiply(5, 3)

def multiply(n1, n2)
  n1 * n2
end

multiply(5, 3)

# Problem 5
def multiply(n1, n2)
  n1 * n2
end

def power(n, power)
  power == 0 ? 1 : multiply(n, 1) ** power
end

p power(5, 3)

m=->x,y{x*y}
s=->x{m[x,x]}
s[5]

# Problem 6
def xor?(b1, b2)
  return "Invalid input! Must be boolean values." if !!b1 != b1 || !!b2 != b2
  b1 != b2
end

xor?(5.odd?, 4.even?) # false
xor?("im a string", true) # "Invalid input! Must be boolean values."

# Problem 7
def oddities(array)
  array.select { |element| array.index(element).even? }
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) #== [1, 3, 5]
p oddities(['abc', 'def']) #== ['abc']
p oddities([123]) #== [123]
p oddities([]) #== []

# Problem 8
def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true

# Problem 9
def real_palindrome?(string)
  string = string.downcase.gsub(/[^0-9a-z]/, '')
  string == string.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# Problem 10
p 020.digits # wtf

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543)