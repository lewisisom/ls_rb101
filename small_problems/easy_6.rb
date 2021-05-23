# Problem 1 - Method returns String representing degrees, minutes, seconds:
DEG_SYMBOL = "\xC2\xB0"

def dms(num)
  degrees = (num.floor % 360)

  minutes = ((num - num.floor).round(9) * 60).floor.to_s
  minutes.prepend('0') if minutes.size == 1

  seconds = ((((num - num.floor).round(9) * 60) - minutes.to_i).round(9) * 60).floor.to_s
  seconds.prepend('0') if seconds.size == 1

  %(#{degrees}#{DEG_SYMBOL}#{minutes}'#{seconds}")
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")

# Problem 2 - Return array of strings without vowels:
def remove_vowels(strings)
  strings.map { |str| str.delete('aiueoAIUEO') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Problem 3 - Calculates index of first Fib num that has a certain number of digits:
require 'pry'

def find_fibonacci_index_by_length(digits)
  index = 2

  first = 1
  second = 1

  loop do
    index += 1
    fib_number = first + second
    break if fib_number.to_s.size >= digits

    first = second
    second = fib_number
  end

  index
end

# until a fib number is the required of number of digits, keep calculating the series
# and add one to a row varibale and then output that row variable

p find_fibonacci_index_by_length(2) #== 7
p find_fibonacci_index_by_length(3) #== 12
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847

# Problem 4 - Reverse an array:
def reverse!(array)
  (array.size / 2).times do |index|
    array[index], array[-(index+1)] = array[-(index+1)], array[index]
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

# Problem 5 - Returns new Array with reversed elements.
def reverse(array)
  new_array = []
  array.size.times { |index| new_array[index] = array[-(index+1)] }
  new_array
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 3, 2]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]

# Problem 6 - Merge two arrays:
def merge(a1, a2)
  (a1+a2).uniq
end

# Put tons of solutions on LS page

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]

# Problem 7 - Returns two nested Arrays that split original array twane.
def halvsies(array)
  array.partition { |element| array.index(element) <= (array.size / 2) }
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

# Problem 8 - Locate the only duplicate in an array.
def OLD_find_dup(array)
  array.select { |element| array.count(element) > 1 }.first
end

def OLD2_find_dup(array)
  new_array = []
  array.each do |element|
    return element if new_array.include?(element)
    new_array << element
  end
end

def find_dup(array)
  array.sort!.find { |element| element == array[array.index(element) + 1] }
end

p find_dup([1, 5, 3, 1]) #== 1
p find_dup([18, 9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

# Problem 9 - Does my Array include this:
def ainclude?(array, search)
  array << search
  !!array.uniq!
end

def OLD2_include?(array, search)
  array.any?(search)
end

def OLD3_include?(array, search)
  array.each { |element| return true if element == search }
  false
end

def OLD4_include?(array, search)
  array << search
  return true if array.uniq! != nil
  false
end

def include?(array, search)
  array.insert(0, search).count(search) > 1
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Problem 10 - Display a right triangle with stars:
def triangle(num)
  num.times { |row| puts ' ' * (num - row - 1) + '*' * (row + 1) }
end

triangle(7)
