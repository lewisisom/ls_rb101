=begin

# Problem 1 - Method that rotates an array- move the first element to the end:
def rotate_array(array)
  array[1..] << array[0]
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]
x == [1, 2, 3, 4]

def rotate_string(string)
  string[1..] << string[0]
end

something = 'hello'
rotate_string(something)
something

def rotate_number(number)
  number.to_s[1..] << number.to_s[0]
end
def rotate_integer(number)
  number.to_s[1..] << number.to_s[0]
end
def rotate_float(number)
  number.to_s[1..] << number.to_s[0]
end

number = 1234.6765
number
rotate_number(number)
number

def rotate_hash(hash)
  (hash.to_a[1..] << hash.to_a[0]).to_h
end

rotate_hash({ key1: 'value1', key2: 'value2', key3: 'value3'})

def rotate(object)
  return object[1..] << object[0] if object.class == Array || object.class == String
  return (object.to_s[1..] << object.to_s[0]).to_ if object.class == Integer || object.class == Float
  return (object.to_a[1..] << object.to_a[0]).to_h if object.class == Hash
  p 'An error has occured.'
end

p rotate(5.66)

# Problem 2 - Method that rotates last n digits of a number:
def rotate_rightmost_digits(number, digits)
  non_rotating = number.to_s.chars[0..((-digits)-1)]
  rotating = number.to_s.chars[-digits..-1]
  rotating = rotating[1..] << rotating[0]
  (non_rotating + rotating).join.to_i
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917

=end

# Problem 3 - Return the "max rotation" of a series of digits:

def max_rotation(num)
  result = num.to_s.chars
  counter = 0

  until counter >= num.to_s.size
    result[counter..-1] = result[counter - 1..] << result[counter]
    counter += 1
  end

  result.join.to_i
end

p max_rotation(735291) #== 321579

# wow
