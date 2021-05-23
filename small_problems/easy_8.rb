=begin
=end

# Problem 1 - Return sum of subsequent sums of an array:
def sum_of_sums(numbers)
  sum = 0
  numbers.size.times { |counter| sum += numbers[0..counter].sum }
  sum
end

p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])
p sum_of_sums([])

# Problem 2 - Create a madlib program:
puts "> Enter an animal:"
animal_1 = gets.chomp
puts "> Enter a verb:"
verb_1 = gets.chomp
puts "> Enter another verb:"
verb_2 = gets.chomp
puts "> Enter a adjective:"
adjective_1 = gets.chomp
puts "> Enter a adverb:"
adverb_1 = gets.chomp
puts "> Enter another adverb:"
adverb_2 = gets.chomp


puts "> Just as the Dursley family #{adverb_1} finished their supper, "
puts "> Dudley's pet #{animal_1} zipped out the front door! The whole "
puts "> family following that #{adjective_1} thing, practically #{verb_1}ing "
puts "> all around it, except for Harry, who was just #{adverb_2} #{verb_2}ing "
puts "> in the yard, watching his creation unfold."

# Problem 3 - Returns an arrary of all substrings from the beginning:
def leading_substrings(str)
  result = []
  str.size.times { |index| result << str[0..index] }
  result
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Problem 4 - Returns an array of all possible substrings:
def substrings(str)
  result = []
  until str.empty?
    str.size.times { |index| result << str[0..index] }
    str[0] = ''
  end
  result
end

p substrings('abcde') == ['a', 'ab', 'abc', 'abcd', 'abcde',
                        'b', 'bc', 'bcd', 'bcde', 'c',
                        'cd', 'cde', 'd', 'de', 'e']

# Problem 5 - Return an Array of all possible substrings that are full palindromes:
def palindrome?(str)
  matches = []
  str.size.times { |index| matches << (str[index] == str[-(index+1)]) }
  matches.all?(true) && matches.size > 1
end

def palindromes(str)
  result = []
  until str.empty?
    str.size.times do |index|
      result << str[0..index] if palindrome?(str[0..index])
    end
    str[0] = ''
  end
  result
end

p palindromes('knitting cassettes') #== ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']

# Problem 6 - FIZZBUZZ we all know and love:

f=->a,b{a.upto(b){|n|x=''
x='Fizz'if n%3<1
x+='Buzz'if n%5<1
p x>''?x:n}}

f[1,15]

# Problem 7 - Double every character in a string:
def repeater(string)
  result = ''
  string.each_char { |char| result << char * 2 }
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Problem 8 - Return new string with all doubled consonant:
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char if CONSONANTS.include?(char.downcase)
    result << char
  end
  result
end

p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
p double_consonants("July 4th") #== "JJullyy 4tthh"
p double_consonants('') == ""

# Problem 9 - Reverse digits in an integer:
def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Problem 10 - Return the middle one or two characters from an input string:
def center_of(string)
  middle = (string.size - 1) / 2.0
  string[middle.floor..middle.ceil]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
