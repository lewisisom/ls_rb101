=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

PROBLEM
  INPUT: an array of strings, where the length of each string is atleast its index + 1
  OUTPUT: A string
  - Output takes the ith character from each string (where i is the index in the array) 
  - Each of these characters is concatenated (in order) to create the output string
  - If the array is empty then the string returned should be empty
  - this also means the size of the output string is the same size as the input array

EXAMPLE


DATA STRUCTURES
  - Array
  - String

ALGORITHM
  - 
  - initialize a new variable assigned to an empty string, we'll call this 'result'
  - iterare through the argument array (Array#each_with_index) and use the position of each element to extract the corresponding character and concatenate it with out empty string (String#<<)
  - return the 'result' string, that's it

=end

def nth_char(arr)
  result = ''
  arr.each_with_index do |word, idx|
    result << word[idx]
  end
  result
end


p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

# Other examples

p nth_char(['yes, no hello']) == 'y'
p nth_char([' theres a space at the beginning of this string', '%a']) == ' a'
p nth_char(['The', 'ocean', 'ma-sive']) == 'Tc-' 
p nth_char(['bob', 'b$lart', '12536']) == 'b$5'
