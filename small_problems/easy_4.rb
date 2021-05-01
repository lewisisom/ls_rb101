=begin

# Problem 1
def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

def short_long_short55555(s1, s2)
  s1.size > s2.size ? (s2 + s1 + s2)  => (s1 + s2 + s1)
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Problem 2
def century(year)
  cardinals = {0 => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th', 5 => 'th', 6 => 'th', 7 => 'th', 8 => 'th', 9 => 'th'}

  century = ((year -1) / 100 + 1).to_s
  determiner = century.to_i.digits.first
  determiner = 0 if century.to_i.digits[1] == 1

  century + cardinals[determiner]
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# Problem 3
def p leap_year?(year)
  return false if year % 4 > 0

  if (year % 100).zero?
    return false if year % 400 > 0
  end
  true
end

p p leap_year?(2_016) == true
p p leap_year?(2_015) == false
p p leap_year?(2_100) == false
p p leap_year?(2_400) == true
p p leap_year?(240_000) == true
p p leap_year?(240_001) == false
p p leap_year?(2_000) == true
p p leap_year?(1_900) == false
p p leap_year?(1_752) == true
p p leap_year?(1_700) == false
p p leap_year?(1) == false
p p leap_year?(100) == false
p p leap_year?(400) == tru

# Problem 4
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    year % 400 == 0 || year % 4 == 0 && year % 100 > 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Problem 5
def multisum(num)
  multiples = []
  (1..num).each { |i| multiples << i if (i % 3).zero? || (i % 5).zero? }
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Problem 6
def running_total(arr)
  output = []

  output << arr[0] if arr.size > 0
  output << arr[1] + output[0] if arr.size > 1
  output << arr[2] + output[1] if arr.size > 2
  output << arr[3] + output[2] if arr.size > 3
  output << arr[4] + output[3] if arr.size > 4
  #...and so on...

  output
end

def running_total2(arr)
  output = []
  counter = 1

  output << arr[0] if arr.size > 0
  while counter < arr.size
    output << arr[counter] + output[counter-1]
    counter += 1
  end

  output
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Problem 7
def string_to_integer(str)
  output = 0
  # Not yet - look at https://launchschool.com/exercises/192719a5
  # Use hash {'1' => 1 } to do it.
  output
end

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570

# Problem 8
DIGITS = {  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
            '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_signed_integer(string)
  digits = string.gsub(/[^0-9]/, '').chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }

  string[0] == '-' ? (value - value * 2) : value
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100

# Problem 9
DIGITS = {  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
            5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
def integer_to_string(int)
  output = ''
  # Unable, see https://launchschool.com/exercises/cdc65476
  output
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'

# Problem 10
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'

=end
# a
