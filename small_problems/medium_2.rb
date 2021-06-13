# Medium 2 Problem # 1 Longest Sentence

# - we have to have a program that can accept a
# .txt file as input
# - the output will be quoting the longest sentence
# in the .txt file based on wordcount, and also 
# saying how many words there are in the longest sentence
# - we could import the .txt file and assign it to
# a variable, which we can then pass into a method,
# im not sure this will work but lets give it a try
# - we will have to convert the .txt file contents
# into a string object we can deal with
# - we are writing a ruby method called longest_sentence
# - algorithm for the method will be:
# - split the input string into sentences based on .!?
# sentence enders, and store it in an array called sentences
# - sort the sentences array by length
# - take the longest sentenece out, turn it into
# a string, print it to the console, and then take the
# size of the sentence in words, and print it to the
# console, and this will be an integer
# - to get the size of this longest string, write
# a secondary method called word_count and pass in
# the longest string we got from the sorted sentences
# array
# - initialize a new array assigned to the input string
# split, based on the single space character ' ' as
# the break point
# - take the size on this new array and return it
# - the word_count method will return this integer
# - that's it, program done

FILE_PATH = '/home/lewis/ls_rb101/small_problems/gutenberg_book.txt'
text = File.read(FILE_PATH)

def word_count(sentence)
  words = sentence.split(' ')
  puts "This sentence contains #{words.size} words."
end

def longest_sentence(text)
  sentences = text.split(/\.|\?|!/)
  sentences.sort_by! { |sentence| sentence.length }
  puts sentences.last + '.'
  word_count(sentences.last)
end

longest_sentence(text)

# Medium 2 Problem #2 Now I Know My ABCs

BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE',
          'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']

# - this is a temporary, simplified method to
# make the problem easier

def easy_block_word?(word)
  word.chars.all? { |letter| BLOCKS.join.include?(letter) }
end

p easy_block_word?('BUTCH')
p easy_block_word?('AUBSF5678932$%^')

# - okay that works, lets do the real deal now

BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE',
          'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']

# - algorithm for the method is:
# - initialize a method called block_word? with one
# parameter, a string
# - initialize a new array called letters, assigned
# to the value of blocks
# - initlialize a new array called chars, assigned to
# the value of the input string capitalized and split
# - iterate through every character in chars,
# and if that character isnt contained within letters,
# then return false for the whole method
# - if a certain character is within letters, delete
# the entire pair of letters from letters
# - if, after iterating through all characters, none
# of them trigger a return false, then go ahead and
# return true for the whole method
# - that's it, program done

def block_word?(word)
  letters = BLOCKS.dup
  chars = word.upcase.chars

  chars.each do |char|
    return false unless letters.join.include?(char)
    letters.delete_at(letters.join.index(char)/2)
  end

  true
end

p block_word?('A') == true
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('123!@#') == false

# Medium 2 Problem #3 Lattercase Percentage Ratio

def letter_percentages(string)
  percentages = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }

  string.chars.each do |char|
    if char.downcase!
      percentages[:uppercase] += 100.0/string.size
    elsif char.upcase!
      percentages[:lowercase] += 100.0/string.size
    else
      percentages[:neither] += 100.0/string.size
    end
  end

  percentages.transform_values! { |percent| percent.round(2) }
end

p letter_percentages('abcABC12345')
p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Medium 2 Problem #4 Matching Parentheses?

# - Let's first implement a non-solution
# that doesn't care about the order of the
# paratheses, just if there's the same number of both

def easy_balanced?(string)
  string.count('(') == string.count(')')
end

p easy_balanced?('What (is) this?') == true
p easy_balanced?('((What)) (is this))?') == false

p '-----'
# - Now, let's do the real deal, accounting
# for the order of parentheses

def balanced?(string)
  count = 0
  string.each_char do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    break if count < 0
  end

  count.zero?
end

p balanced?('') == true
p balanced?(')(()') == false
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Medium 2 Problem # Triange Sides

# - formulas to determine which kind of triangle
# it is:
# - invalid if side 1 or side 2 or side 3 is length 0
# OR if side 1 is larger than the sum of side 2 and side 3,
# and side 2 is larger than the sum of side 3 and side 1,
# and side 3 is larger than the sum of side 1 and side 2
# - its an equilateral if side 1 equals
# side 2 equals side 3
# - its a scalene if side 1 doesnt equal side 2 doesnt
# equal side 3 doesnt equal side 1
# - its an isosceles if it isnt already
# equilateral, scalene, or invalid

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if sides.max > sides.sum / 2 || sides.min.zero?
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid

# Medium 2 Problem # 6 Tri-Angles

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.sum != 180 || angles.min.zero?
  case angles.max
  when 90 then :right
  when 0...90 then :acute
  else :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# Medium 2 Problem # 7 Unlucky Days

# - write a ruby method to give you how many
# friday the 13ths occur in a given year
# - for example, 2019 had 2 friday the 13ths
# - make a data structure containing all days
# in the given year using a special time class
# - test that data structure and count how many
# days match the pattern of friday the 13th
# - that integer will be the methods return value,
# that's it, program done

require 'date'

def friday_13th(year)
  days = []
  for day in (1..365)
    date = Date.ordinal(year, day)
    days << date.wday * date.day
  end
  days.count(65)
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Five Fridays Extra Problem

require 'date'

def five_fridays(year)
  fridays = []
  number_of_days = Date.gregorian_leap?(year) ? 366 : 365
  for day in (1..number_of_days)
    date = Date.ordinal(year, day)
    fridays << date.month if date.wday == 5
  end
  fridays.count - 48
end

p five_fridays(2021) #== 5
p five_fridays(2020) #== 4

# Medium 2 Problem # 8 Next Featured Number Higher than a Given Value

# - we are writing one ruby method called featured
# with one parameter, an integer we'll call num
# - but, if the number is larger than 9999999999,
# return an error message as a string
# - iterate through every number onwards until
# a featured number is hit, then the method return
# value will simply be that integer
# - you know if a number is a featured number if
# it meets the requirements:
# - num.odd? and (num % 7).zero? and num.digits.uniq! == nil
# - that's it, program done

def featured(num)
  return 'Error! No featured numbers exist over 10 digits!' if num >= 9876543210
  loop do
    num += 1
    break if num.odd? && (num % 7).zero? && num.digits.uniq! == nil
  end
  num
end

p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987
p featured(9_999_999_999) # There is no possible number that fulfills those requirements

# Medium 2 Problem # 9 Bubble Sort

# - we are writing one ruby method called bubble_sort!
# with one parameter, an array with atleast two elements,
# and we are going to return a sorted version of that array
# - our sorting algorithm will be bubble sort, which is:
# - compare two elements, if the first is bigger, then
# swap them, if not, dont swap, and move on to the
# second and third elements, repeating this process
# - once a full pass through the array doesnt do anything,
# we know its sorted, and the return value for this method
# will be that array
# - note that we are mutating the input array,
# so we will be returning the same object, not creating a new one
# - closer to code, the algorithm for the body of this
# method will be:
# - start up a loop, and create a temporary dup of the
# current array called dup_array
# - iterate over every element and its element+1, except
# for the final element
# - if the element is larger than its element+1, swap
# them, if not, continue on to the next element
# - break out of this loop if dup_array and array are equal
# - return array
# - that's it, program done

def bubble_sort!(array)
  loop do
    same = true
    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        same = false
      end
    end
    break if same
  end
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Medium 2 Problem # 10 Sum Square - Square Sum

# - we are writing a ruby method called
# sum_square_difference with one parameter
# for a positive integer
# - first, compute the sum of all numbers from 1
# to n, then square it, then assign that to a
# new variable called square_of_sum
# - second, iterate through every number from
# 1 and n, square all of them, and then combine them
# with addition into one number and assign that
# to a new variable called sum_of_squares
# - next, the return value for this method will be
# the integer value you get from
# subtracting sum_of_squares from square_of_sum
# - that's it, program done

def sum_square_difference(num)
  square_of_sum = ((1..num).sum)**2
  sum_of_squares = (1..num).map { |n| n**2}.sum
  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# Done with Medium 2 !
