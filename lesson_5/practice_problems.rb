# Problem 1 - Order array of numbers, descending:

arr = ['10', '11', '9', '7', '8']

p (arr.sort do |str1, str2|
  str2.to_i <=> str1.to_i
end)

p arr.sort_by(&:to_i).reverse

# Problem 2 - Sort array of hashes based on value:

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p (books.sort_by do |book|
  book[:published].to_i
end)

# Turn year string into integer and then sort.
# This .to_i is actually unnecessary, since all the years are 4 digits.

# Problem 3 - Reference one specific character:

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

p arr1[-1][1][-1]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

p arr3[-1][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p hsh2[:third].keys[0]

# Problem 4 - Change all value occurences to a different value:

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[-1] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][-1][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][-1] = 4
p hsh2

# Problem 5 - Figure out total male age:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

integer = 0

munsters.each_value do |info|
  if info["gender"] == "male"
    integer += info["age"]
  end
end

p integer

# create an integer
# iterate over every element in munsters hash
# if the gender value is male
# add the age value to integer
# print integer, program done

# Problem 6 - Print name, age, and gender of each in one string:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (Name) is a (age)-year-old (male or female).

munsters.each do |name, info|
  puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}."
end

# iterate over each element in munsters
# know how to access the key
# know how to access each value in each value
# put together in a one line string concatenation and print it
# end the loop do, end program

# Problem 7 - Determine the final values of these variables:

a = 2
b = [5, 8]
arr = [a, b]

# At this point, a is 2, b is [5, 8], arr is [2, [5, 8]].

arr[0] += 2 # At this point, a is 2, b is [5, 8], arr is [4, [5, 8]].
arr[1][0] -= a # At this point, a is 2, b is [3, 8], arr is [4, [3, 8]].

# The final value of a:
# 2
# The final value of b:
# [3, 8]

# Problem 8 - Using each, output all vowels from strings:

hsh = { first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog'] }

vowels = []

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      vowels << char if 'aiueoAIUEO'.include?(char)
    end
  end
end

p vowels

# create new array called vowels
# iterate over hsh using each
# iterate over the arrays in hsh value spots
# iterate over every character in those arrays
# if the character is a vowel, add it to array called vowels
# if not, move on to next character
# end the loop, print the value of vowels, program end

# Problem 9 - Return new array but with descending ordered sub arrays:

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |array|
  array.sort do |a, b|
    b <=> a
  end
end)

# initialize a new array
# iterate over each array element in arr
# call sort on each element
# reverse the element in each sub-array
# end the loop, return new array, program end

# Problem 10 - Use map return new array, increment all integers by 1:

p ([{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new = {}
  hash.each do |key, value|
    new[key] = value + 1
  end
  new
end)

# Problem 11 - Return new array of only multiples of 3:

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |array|
  array.select do |integer|
    integer % 3 == 0
  end
end)

# Problem 12 - Return hash where key is first item and value is second:

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash = {}

arr.map do |sub|
  hash[sub[0]] = sub[1]
end

p hash

# iterate over every sub-array within the arr array
# since every sub-array has two elements, this is easy
# initialize a new hash
# assign the first element in sub-array to key
# assign the second element in sub-array to value
# after finishing iterating, return the new hash, end program

# Problem 13 - Return array, same sub-arrays, but ordered dependent on only odd numbers:

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

p arr.sort.reverse

p (arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end)

# Problem 14 - Return array with colors of fruits and sizes of vegatables:
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

colors_sizes = []

hsh.each_value do |sub_hash|
  case sub_hash[:type]
  when 'fruit'
    colors_sizes << sub_hash[:colors].map(&:capitalize)
  when 'vegetable'
    colors_sizes << sub_hash[:size].upcase
  end
end

p colors_sizes

# Problem 15 - Return array containing only even integer hashes:

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |integer|
      integer.even?
    end
  end
end)

# Problem 16 - Make one UUID:

def uuid
  id = ''
  id << %w(0 1 2 3 4 5 6 7 8 9 a b c d e f).sample until id.size >= 32
  4.times { |i| id.insert(8+i*5, '-') }
  id
end

p uuid

# Done