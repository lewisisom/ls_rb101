# Problem 1
def repeat(string, positive_integer)
  positive_integer.times { puts string }
end
repeat('Hello, World!', 6)

# Problem 2
def odd?(integer)
  integer % 2 == 1
end
p odd?(4)

# Problem 3
def digits(num)
  num.to_s.chars.map(&:to_i)
end
p digits(25_000)
# Note: .chars is the same as .split('')
# Note: .map(&:to_i) is the same as .map { |char| char.to_i }

# Problem 4
def count(array)
  hash = array.uniq.to_h { |vehicle| [vehicle, 0] }
  array.each { |vehicle| hash[vehicle] += 1 }
  hash.to_a.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']
p count(vehicles)
system('clear')

# Problem 5
def reverse_sentence(string)
  string.split(' ').reverse.join(' ')
end
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
# Note: .split is the same as .split(' ')

# Problem 6
def reverse_words(string)
  string.split.each { |word| word.reverse! if word.length >= 5 }.join(' ')
end
puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
system('clear')

# Problem 7
def stringy(int)
  '10' * (int / 2) + '1' * (int % 2)
end
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Problem 8
def average(arr)
  arr.sum.to_f / arr.size # Normal version is arr.sum / arr.size
end
puts average([1, 6]) #== 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40

# Problem 9
def sum(int)
  int.digits.sum
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
system('clear')

# Problem 10
def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end
puts calculate_bonus(2_800, true) == 1_400
puts calculate_bonus(1_000, false) == 0
puts calculate_bonus(50_000, true) == 25_000
