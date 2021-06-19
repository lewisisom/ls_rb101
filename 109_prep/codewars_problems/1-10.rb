# https://docs.google.com/document/d/1usQUJQFr6PGVo3ZWgMi3nVtDRdeUuOUNRtZPtSKkYuE/edit#heading=h.8sf25q8ccj8w

=begin

# Problem # 1 Count Letters in String

Count letters in string

In this kata, you've to count lowercase letters in 
a given string and return the letter count in a hash
with 'letter' as key and count as 'value'.
The key must be 'symbol' instead of string in Ruby
and 'char' instead of string in Crystal.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

# UNDERSTANDING THE PROBLEM

# input: - any string at all
# output: - a hash, with the count of each lowercase letter

# important stuff:
# - anything characters that are not lowercase letters
# are completely ignored, so an input of 'ABC123' would
# give the same output as an empty string ''.
# - we will only be recieving strings, nothing else
# - we will be representing each lowercase letter
# that appears as a Ruby symbol in a hash, not a string
# - we do not need to have the hash be in a kind of
# sorted order based on frequency

# clarifying questions:
# - why is there a paratheses after a couple of the
# test cases? is that just a typo? (i will assume it is)

# EXAMPLES / TEST CASES

# 'HEY IM COOL' ==> {}
# 'aaaaaaa' ==> {:a=>7}
# ['alright guys'] (this could never be the input)
# '\n\r\n\r\n' ==> {:n=>3, :r=>2}
# "\n\r\n\r\n" ==> {}
# "www.google.com/" ==> {:w=>3, :g=>2, :o=>3, :l=>1, :e=>1, :c=>1, :m=>1}

# DATA STRUCTURE

# - string, any string, input
# - hash,
# we're going to start with an empty hash
# and eventually fill it and return it as the return value
# - we may turn the string into an array temporarily
# to iterate over everything in the string, although
# we need to be careful for any transfer errors

# ALGORITHM

# - define the letter_count method
# - initialize a new hash called counts, assigned to
# any empty hash
# - initilaize a new constant called alphabet, assigned
# to a string with all the lowercase letters in it
# - turn the input string into an array and iterate
# over it, on the same line, and for every character,
# if it is in the alphabet constant, then add 1 to
# the counts hash's key for that character and if
# the key doesnt yet exist, create it with an initial
# value of in the integer 1
# - once done iterating and updating, return the
# counts hash, that's it, program done

# CODE

ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def letter_count(string)
  counts = {}

  string.each_char do |char|
    if ALPHABET.include?(char)
      if counts[char.to_sym].nil?
        counts[char.to_sym] = 1
      else
        counts[char.to_sym] += 1
      end
    end
  end

  counts
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('HEY IM COOL') == {}
p letter_count('aaaaaaa') == {:a=>7}
p letter_count('\n\r\n\r\n') == {:n=>3, :r=>2}
p letter_count("\n\r\n\r\n") == {}
p letter_count("www.google.com/") == {:w=>3, :g=>2, :o=>3, :l=>1, :e=>1, :c=>1, :m=>1}

# Problem # 2 Find All Pairs

# Find all pairs

# You are given array of integers, your task will
# be to count all pairs in that array and return
# their count.

# Notes:

# Array can be empty or contain only one value;
# in this case return 0
# If there are more pairs of a certain number,
# count each pair only once. E.g.: for [0, 0, 0, 0]
# the return value is 2 (= 2 pairs of 0s)
# Random tests: maximum array length is 1000,
# range of values in array is between 0 and 1000
# Examples
# [1, 2, 5, 6, 5, 2]  -->  2
# ...because there are 2 pairs: 2 and 5

# [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
# ...because there are 4 pairs: 2, 20, 6 and 2 (again)
# =end

# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0

# UNDERSTANDING THE PROBLEM

# input: - an array with integers
# output: - an integer, a count of how many pairs
# of numbers there are in the input array

# important stuff:
# - three of the same number is still just one pair
# - we are only dealing with positive integers, and
# integers, from range 0 to 1000, and the array
# has max 1000 integers in it, no negative numbers
# - an empty array or an array with only one number,
# we know the return value will be 0, 0 pairs

# EXAMPLES / TEST CASES

# [1, 1, 1, 2, 2, 2, 3, 3, 3] == 3
# [1, 10, 100, 1000] == 0
# [1, 1, 1, 1, 1, 1, 1] == 3

# DATA STRCUTURE

# - input array
# - output integer
# - the output integer will be a variable
# that will start empty and will increase
# when pairs are detected
# - we will modify this input array using a
# mutatative iterative method, going through
# and replacing elements with their counts,
# so [1, 1, 5, 6] would turn to [2, 1, 1]

# ALGORITHM

# - THIS ALGORITHM BELOW IS GARBAGE
# - define the method pairs, with one parameter,
# called numbers (the input array)
# - destrcutively iterate through numbers
# and IN SOME WAY making an array with the count
# of each element in the array
# - after done iterating, iterate through this again,
# and make an array with how many times it can be divided
# by two, so the count array [5, 4, 1, 1] would turn to
# [2, 2, 0, 0]
# - add up all the values in this final array,
# and this will be the return value of this method
# ^^^ trash ^^^

# CODE

def pairs(numbers)
  return 0 if numbers.size < 2

  counts = {}
  pairs = []
  numbers.each { |num| counts[num].nil? ? counts[num] = 1 : counts[num] += 1 }
  counts.values.each { |num| pairs << num / 2 }

  pairs.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
p pairs([1, 1, 1, 2, 2, 2, 3, 3, 3]) == 3
p pairs([1, 10, 100, 1000]) == 0
p pairs([1, 1, 1, 1, 1, 1, 1]) == 3

# Problem # 3 Returning Substring Instance Count

# Return substring instance count

# Complete the solution so that it returns
# the number of times the search_text is found
# within the full_text.

# Usage example:

# solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2
# since bb shows up twice
# solution('aaabbbcccc', 'bbb') # should return 1

# p solution('abcdeb','b') == 2
# p solution('abcdeb', 'a') == 1
# p solution('abbc', 'bb') == 1

def solution(string, key)
  string.count(key) / key.size
end

p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
p solution('aaabbbcccc', 'bbb') == 1
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

# Problem # 4 Alphabet Symmetry

# Alphabet symmetry
# Consider the word "abode".
# We can see that the letter a is in position
# 1 and b is in position 2. In the alphabet,
# a and b are also in positions 1 and 2.
# Notice also that d and e in abode occupy
# the positions they would occupy in the alphabet,
# which are positions 4 and 5.

# Given an array of words, return an array
# of the number of letters that occupy their
# positions in the alphabet for each word.
# For example,

# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
# See test cases for more examples.

# Input will consist of alphabet characters,
# both uppercase and lowercase. No spaces.

# Good luck!
# If you like this Kata, please try:
# Last digit symmetry
# Alternate capitalization

# p solve(["abode","ABc","xyzD"]) == [4,3,1]
# p solve(["abide","ABc","xyz"]) == [4,3,0]
# p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
# p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def solve(strings)
  in_position = Array.new(strings.size, 0)

  strings.each_with_index do |string, index|
    string.size.times do |position|
      if string[position].downcase == ALPHABET[position]
        in_position[index] += 1
      end
    end
  end

  in_position
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# Problem # 5 Longest Vowel Chain

# Longest vowel chain

# The vowel substrings in the word codewarriors
# are o,e,a,io. The longest of these has a length of 2.
# Given a lowercase string that has alphabetic
# characters only and no spaces, return the length of
# the longest vowel substring. Vowels are any of aeiou.

def solve(string)
  string.split(/[b-df-hj-np-tv-z]/).sort_by { |group| group.size }.last.size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

=end

# Problem # 6 Non-even Substrings

# Given a string of integers, return the
# number of odd-numbered substrings that can be formed.

# For example, in the case of "1341",
# they are 1, 1, 3, 13, 41, 341, 1341, a
# total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.
# =end

# UNDERSTANDING THE PROBLEM

# input: - a string of digits
# output: - an integer, the number of substrings you
# can make that have atleast one odd digit in each

# important things: - we are including every possible
# substring, any length and any position in the
# input string, so we're going to have a lot of substrings,
# specifically, we're going to have
# size 4 -> 4 + 3 + 2 + 1 = 10
# size 3 -> 3 + 2 + 1 = 6
# this many substrings, assuming all the digits are odd
# in ruby specifically, that could be 1.upto(size)
# now whats the formula if we also have even numbers?
# '111' => 6
# '211' => 5
# '121' => 5
# so this means if there is 1 even digit in any size,
# this will only decrease it by 1
# '222' => 0
# '122' => 3
# '212' => 4 # THIS MEANS IT MATTERS WHERE THE
# ODD AND EVEN NUMBERS ARE, THIS MAKES THE PROBLEM
# MUCH MORE COMPLICATED
# different approach
# all possible substrings -> filter out ones
# with even digits -> count how many there are

# ALGORITHM

# - define a method called solve, with one parameter,
# a string, we'll call this digits
# - IN SOME WAY, make an array of all possible
# substrings
#   - grab a slice of the digits string based on some
#   length that increases until its the size of
#   the digits string
#   - start at 0, that means iniitliaze a counter and
#   a loop that breaks once the counter is the size of digits
#   - 
# - IN SOME WAY, filter out all substrings that have
# no odd digits
#   - 
# - return the number of remaining substring,
# that's it, program done

# FIGURING IT OUT

# '12121' => 3 + 4 + 3 + 2 + 1 = 13
# '21211' => 3 + 4 + 3 + 2 + 1 = 13
# '22111' => 3 + 3 + 3 + 2 + 1 = 12

# '22211' => 2 + 2 + 2 + 2 + 1 = 9
# '21212' => 2 + 4 + 3 + 2 + 1 = 12

# the formula for determing how many substrings:
# (1.upto(size).sum) - 1

# LETS SOLVE SOME DUMBED DOWN VERSIONS TO UNDERSTAND
=begin
def easy(digits)
  evens = 0

  digits.each_char do |char|
    evens += 1 if char.to_i.even?
  end

  (1.upto(digits.size).sum) - 2 * evens
end

p easy('13579') #== 15
p easy('5775577') #== 28
p easy('222') #== 0
p easy('2211') #== 7

# LETS THINK OF THIS IN A DIFFERENT WAY

# - GENERATE SUBSTRINGS

def generate_substrings(string)
  substrings = []

  string.size.times do |index|
    string.size.times do |length|
      substrings << string.slice(index, length + 1)
    end
  end

  substrings.uniq
end

p generate_substrings('abcd')

# CODE

# def generate_substrings(string)
#   substrings = []

#   string.size.times do |index|
#     string.size.times do |length|
#       substrings << string.slice(index, length + 1)
#     end
#   end

#   substrings.uniq
# end

# p generate_substrings

# def solve(digits)
#   stuff = generate_substrings(digits)

#   stuff.size
# end

#p solve("1341") #== 7
#p solve("1357") #== 10
# p solve("13471") == 12
# p solve("134721") == 13
# p solve("1347231") == 20
# p solve("13472315") == 28

# Problem # 7 Substring Fun

# Already done in session.rb

# Problem # 8 Repeated Substring

# For a given nonempty string s find a minimum
# substring t and the maximum number k, such that
# the entire string s is equal to t repeated k times.
# The input string consists of lowercase latin letters.
# Your function should return a tuple (in Python)
# (t, k) or an array (in Ruby and JavaScript) [t, k]

# Example #1:

# for string

# s = "ababab"
# the answer is

# ["ab", 3]
# Example #2:

# for string

# s = "abcde"
# the answer is

# because for this string "abcde" the minimum
# substring t, such that s is t repeated k times,
# is itself.

# p f("ababab") == ["ab", 3]
# p f("abcde") == ["abcde", 1]

# UNDERSTANDING THE PROBLEM

# input: - any non-empty string
# output: - an array with two elements, the first
# being the repeated string and the second being
# the number or repetitions, so the format for the
# output is [string, integer]

# important things:
# - strings that cant be reduced to a repeated
# string will simply return [string, 1], 1 repetition
# - were are writing a ruby method called f
# - the input non-empty string will
# only have lowercase letter of the alphabet

# EXAMPLES / TEST CASES

# "aabb" == ['aabb', 1]
# "a" == ['a', 1]
# "madamadamada" == ['mada', 3]
# "zzzzzxczzzzzxnzzzzzxczzzzzxn" == ['zzzzzxczzzzzxn', 2]

# DATA STRUCTURE

# start with a string as input,
# end with an array as output
# have another array where strings will
# be split into differing sizes
# we will then have an array with every element
# a section of the input string and all of the elements
# will be indentical, so we simply make a new
# array and put in the string and how many times
# it appears, which will be the size of the array

# ALGORITHM

# - define a ruby method called f, with one parameter,
# any string with only lowercase letters, and we'll
# call the parameter string

# CODE

def f(string)
  1.upto(string.size) do |size|
    if string.slice(0, size) * (string.size / size) == string
      return [string.slice(0, size), string.size / size] 
    end
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
p f("aabb") == ['aabb', 1]
p f("a") == ['a', 1]
p f("madamadamada") == ['mada', 3]
p f("zzzzzxczzzzzxnzzzzzxczzzzzxn") == ['zzzzzxczzzzzxn', 2]

=end

# Problem # 9 Typoglycemia Generator
