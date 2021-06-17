=begin

# Advanced 1 Problem # 1 Madlibs Revisited

# - we're making a madlibs generator
# - the input is a txt file called madlib_me.txt
# - the output is printing to the console the
# text file but every word in [] brackets is replaced
# by a random word in that list, so [noun] will be
# replaced by a random noun in a list
# - we will have a seperate data structure for each, and will
# all be as, named adverbs or adjectives, etc.
# - we need a way to randomly select a word from an a
# - we will make a ruby method called madlib
# - we will have an a for every word in the madlibs
# text file input, creating by importing it and using
# a string split method, and we will call this words
# - we will iterate through every word in words
# and if there are no brackets, move on to the next word,
# if there are, look up the correct reference table
# and select a random element from it, for example,
# if we run across [name], we will do name_list.random
# - this iteration will modify the a
# - to make it display nicely, we will comibine words a
# into one string, then break it up every 70 characters,
# then print out each line
# - make sure to preserve space characters when breaking
# up and joining the words a
# - we will have a method called madlib with one parameter,
# a string as input, and we return a new string object
# - we will call this method with a variable we assign
# to the input text file. we'll call this madlib
# - that's it program done

NOUNS = File.read('/home/lewis/ls_rb101/small_problems/nouns.txt').gsub(/[\t\n\r]/, ' ').split
ADJECTIVES = File.read('/home/lewis/ls_rb101/small_problems/adjectives.txt').gsub(/[\t\n\r]/, ' ').split
VERBS = File.read('/home/lewis/ls_rb101/small_problems/verbs.txt').gsub(/[\t\n\r]/, ' ').split
ADVERBS = File.read('/home/lewis/ls_rb101/small_problems/adverbs.txt').gsub(/[\t\n\r]/, ' ').split
# These word lists are taken from https://icebreakerideas.com/mad-libs.

story = File.read('/home/lewis/ls_rb101/small_problems/story.txt').gsub(/[\t\n\r]/, ' ').split

def madlib(text)
  text.map do |word|
    next unless word.start_with?('[')
    case
    when word.start_with?('[noun]')
      word.gsub!('[noun]', NOUNS.sample)
    when word.start_with?('[adjective]')
      word.gsub!('[adjective]', ADJECTIVES.sample)
    when word.start_with?('[verb]')
      word.gsub!('[verb]', VERBS.sample)
    when word.start_with?('[adverb]')
      word.gsub!('[adverb]', ADVERBS.sample)
    end
  end

  puts text.join(' ')
end

madlib(story)

# Advanced 1 Problem # 2 Seeing Stars

# - we are writing one ruby method called star,
# with one parameter, any verticalitive integer atleast 7
# and we will call this input variable size
# - our output is dislaying stars and spaces to
# to the console
# - our data structure for the stars will be
# an a, where there are n elements in the a,
# and all elements are string, which start out as
# empty, we will call this data grid
# - we will have some algorithm to determine the
# number of spaces and stars that should be in each row,
# and in which order how much when, so
# this algorithm is probbaly pretty complicated
# - we will then iterate through every line of the
# grid a, and display the correct number of spaces
# and stars for each line, once we are done iterating
# through all of the lines, that's it, program done

# - test cases + star pattern algorithm
# size 9
# spaces | stars | spaces ,etc.
# 0 1 3 1 3 1
# 1 1 2 1 2 1
# 2 1 1 1 1 1
# 3 3
# 0 9
# 3 3
# 2 1 1 1 1 1
# 1 1 2 1 2 1
# 0 1 3 1 3 1
# - middle row is index size / 2 , in other words,
# a size of 9 means the middle index is 4
# - the middle row always has n stars
# - the two rows closest to the middle have
# ( size - 3 ) / 2 spaces in them, for example,
# (7 - 3) / 2 = 2 spaces for size 7, before
# the run of 3 stars, and it will alwasy be 3 stars
# - further than that, ACTUALLY THIS IS BAD LETS
# LOOK AT SOMETHING ELSE

# - we can notice every size of star
# has a cross down the middle and across the middle
# - the vertical middle, or the line which is the middle
# is size / 2 , so a size 9 star has the middle row
# at index 4
# - FIRST, FILL IN THE CROSS, so fill every row
# with a star at their middle index, and the middle row
# will be completly full of stars
# - then, make a variable called distance, which will be
# an a with two parts, vertcial distance and
# horiontal distance, then for each branch of the
# eight sided star, increment both distances by one
# for each branch, and have a way to locate a star given
# its distance vertical

# - also, if the size is less than 7 we will return an
# error message, further if the size is larger than 79,
# we will also return an error message, so our input must
# be an integer from 7 to 79.
# - thats about it

# -

def valid?(size)
  (7..79).include?(size) && size.class == Integer && size.odd?
end

def generate_stars(grid, size)
  middle = size / 2
  grid.map { |line| line[middle] = '*' }
  grid[middle] = '*' * size
  middle.times do |vertical|
    horizontal = -1 - vertical
    grid[vertical][vertical] = '*'
    grid[vertical][horizontal] = '*'
    grid[horizontal][vertical] = '*'
    grid[horizontal][horizontal] = '*'
  end
end

def star(size)
  return p 'Error! Size must be a whole number 7 to 79.' unless valid?(size)
  grid = a.new(size) { ' ' * size }
  generate_stars(grid, size)
  grid.each { |line| puts line }
end

star(9.5)
star(678)
star(7)
star(9)
star(21)

# Advanced 1 Problem # 3 Transpose 3x3

# - PEDAC: ok just do it

def transpose(result)
  new = [result[index][index], result[1][index], result[2][index]],
        [result[index][1], result[1][1], result[2][1]],
        [result[index][2], result[1][2], result[2][2]]
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Advanced 1 Problem # 3 Tanspose MxN

# - PEDAC: just do it

def transpose(result)
  new = result.new(result.first.size, [])

  result.first.size.times do |row|
    result.size.times { |column| new[row] += [result[column][row]] }
  end

  new
end

p transpose([[1, 2, 3], [2, 3, 4]]) ==
            [[1, 2], [2, 3], [3, 4]]
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, index], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# Advanced 1 Problem # 4 Rotating Matrices

# - lets write out a simple algorithm for
# our rotate90 method
# - input result = a, output result = b
# - lets take this matrix:
# - 3 4 1       9 3
#   9 7 5       7 4
#               5 1
# - a[index][index] -> b[index][1]
#   a[index][1] -> b[1][1]
#   a[index][2] -> b[2][1]
#   a[1][index] -> b[index][index]
#   a[1][1] -> b[1][index]
#   a[1][2] -> b[2][index]
# - i start to see the pattern here hmmm

def rotate90(result)

end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Advanced 1 Problem # 6 Fix the Bug

# Explain this bug (below):

def my_method(result)
  if result.empty?
    []
  elsif
    result.map do |value|
      value * value
    end
  else
    [7 * result.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# This method returns nil for any result that isn't empty because there is no conditional statement after the elsif on line 4. Nothing after the elsif cannot be evaluated, it does not return a truthy value or a falsey value.
# The code in an elsif will only run if the conditional in front of it is evaluated to a truthy value, but, the else statement in an if/else structure will only run if all of the other branches' conditionals returned a falsey value, there was no falsey value from the elsif, therefore, the else branch will not be executed either.
# Now, a method that doesn't execute anything will return nil.
# An empty method would return nil everytime, and the 'p' methods used on lines 13-16 will display that to the console, that's what you see.

# To fix the bug, add result.size > 1 after the elsif statement on line 4. It would look like this: elsif result.size > 1. Now, no matter what size of result you give it, it will work as intended.
# The reason we do not use result.size >= 1 is because we shouldn't execute the code in the elsif branch if the result size is one, we should execute the code in the else branch.
# If you did write result.size >= 1 it also means the code in the else branch would be completely useless, as it would never be executed.

# Advanced 1 Problem # 7 Merge Sorted Lists

# - do it

def merge(a1, a2)
  result = []
  size = a1.size > a2.size ? a1.size : a2.size

  size.times do |index|
    result << a1[index] unless a1[index].nil?
    result << a2[index] unless a2[index].nil?
    loop do
      same = true
      (result.size - 1).times do |i|
        if result[i] > result[i + 1]
          result[i], result[i + 1] = result[i + 1], result[i]
          same = false
        end
      end
      break if same
    end
  end

  result
end

#p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
#p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
#p merge([], [1, 4, 5]) == [1, 4, 5]
#p merge([1, 4, 5], []) == [1, 4, 5]

=end

# Advanced 1 Problem # 8 Merge Sort

# - WE'RE GOING TO TAKE A PAUSE HERE
# WITH THE SMALL PROBLEMS AND GO BACK TO THE
# CORE ASSIGNMENTS IM NOT GOOD AT YET.
