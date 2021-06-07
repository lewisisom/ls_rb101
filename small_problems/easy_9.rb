# Problem 1 - Return a string greeting using info provided in method arguements:
def greetings(name, status)
  "And here we have, #{name.join(' ')}! #{status[:title]} #{name.last} " \
  "has been a #{status[:occupation]} for as long as any of you can remember!"
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Problem 2 - Double the numerical value unless its a 'double number' like 7676:
def twice(num)
  center = num.to_s.size / 2
  left = center.zero? ? '' : num.to_s[0..center - 1]
  right = num.to_s[center..-1]

  left == right ? num : num * 2
end

p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(7676) == 7676
p twice(5) == 10

# Problem 3 - Return the negative version of the integer:
def negative(int)
  - int.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# Problem 4 - Return an Array of all integers up to the given:
def sequence(num)
  num.positive? ? [*1..num] : [*num..-1].reverse
end

p sequence(5)
p sequence(-3)

# Problem 5 - Return a boolean for whether all alphabetic characters of a string are uppercase:
def old_uppercase?(str)
  str == str.upcase
end

def uppercase?(str)
  str == str.upcase if str.chars.any? { |char| char =~ /[a-z]/i }
end

p uppercase?('t') #== false
p uppercase?('T') #== true
p uppercase?('Four Score') #== false
p uppercase?('FOUR SCORE') #== true
p uppercase?('4SCORE!') #== true
p uppercase?('') #== true

# Problem 6 - Return Array containing all words and their length in each cell:
def word_lengths(str)
  str.split.map { |word| word + ' ' + word.length.to_s }
end

p word_lengths('cow sheep chicken') #== ['cow 3', 'sheep 5', 'chicken 7']

# Problem 7 - Print out a surname, name given a full name string:
def old_swap_name(name)
  surname = name.split[-1]
  firstname = name.split[0]
  "#{surname}, #{firstname}"
end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Problem 8 - Given 2 integers, return array w/ size of first int and multiples of second int:
def sequence(size, multiple)
  sequence = Array.new(size, multiple)
  size.times { |index| sequence[index] += multiple * index }
  sequence
end

# (1..size).map { |multiple| multiple * size }

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1_000_000) == []

# Problem 9 - Determine the letter grade of the average of three scores passed in:
def get_grade(sc1, sc2, sc3)
  average = (sc1 + sc2 + sc3) / 3
  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'F'
  else 'A+'
  end
end

p get_grade(105, 105, 99) == 'A+'
p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'

# Problem 10 - Convert a list with quantities into a list with each item occuring its quanitity:
def old_buy_fruit(list)
  expanded_list = []
  list.each { |item| expanded_list << Array.new(item[1], item[0]) }
  expanded_list.flatten!
end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([['apples', 3], ['orange', 1], ['bananas', 2]]) == ['apples', 'apples', 'apples',
                                                                'orange', 'bananas', 'bananas']

# Problem 11 - Print out groups (arrays) of words that are anagrams, given a bunch of words:
words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl',
         'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

def anagrams(words)
  letters = words.map { |word| word.chars.sort.join }.uniq
  anagrams = []

  letters.size.times do |index|
    anagrams << []
    words.each do |word|
      anagrams[index] << word if word.chars.sort.join == letters[index]
    end
  end

  puts '<===> Here are all of the anagrams <===>'
  anagrams.each { |anagram| p anagram }
end

anagrams(words)
