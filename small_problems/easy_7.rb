=begin

# Problem 1 - Combine two arrays, alternating adding elements:
def interleave(a1, a2)
  result = []
  a1.size.times do |index|
    result << a1[index]
    result << a2[index]
  end
  result
end

def interleave(a1, a2)
  a1.zip(a2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

# Problem 2 - Return hash containing # of chars of how many lower/upper case:
def letter_case_count(str)
  count = { lowercase: 0, uppercase: 0, neither: 0 }

  str.chars.each do |char|
    if /[a-z]/.match?(char)
      count[:lowercase] += 1
    elsif /[A-Z]/.match?(char)
      count[:uppercase] += 1
    else
      count[:neither] += 1
    end
  end

  count
end

def letter_case_count(str)
  count = {}
  count[:lowercase] = str.count('a-z')
  count[:uppercase] = str.count('A-Z')
  count[:neither] = str.size - count[:lowercase] - count[:uppercase]
  count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Problem 3 - First of every word capitalized:
def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

puts word_cap('four score and seven') #== 'Four Score And Seven'
puts word_cap('the javaScript language') #== 'The Javascript Language'
puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'

# Problem 4 - Swapcase without using swapcase:
def swapcase(words)
  chars = words.chars
  chars.map do |char|
    if char =~ /[a-z]/
      char.upcase!
    elsif char =~ /[A-Z]/
      char.downcase!
    end
  end
  chars.join('')
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'

# Problem 5 - Return new String alternating upcase and downcase:
def staggered_case(str, need_upcase = true)
  result = ''
  str.chars.each do |char|
    need_upcase ? result << char.upcase : result << char.downcase
    need_upcase = !need_upcase
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Problem 6 - Same as before, except don't count non-alpabetic characters when counting:
def staggered_case(str, need_upcase = true, count_non_alphabetic = false)
  result = ''
  str.chars.each do |char|
    if char =~ /[a-z]/i || count_non_alphabetic
      need_upcase ? result << char.upcase : result << char.downcase
      need_upcase = !need_upcase
    else
      result << char
    end
  end
  result
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS', true, false)
p staggered_case('ignore 77 the 444 numbers', false, true)

# Problem 7 - Multiplies all nummbers in an array divided by number of digits:
def show_multiplicative_average(array)
  average = '%.3f' % (array.inject(:*) / array.size.to_f)
  puts "The result is #{average}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

# Problem 8 - Multiply two Arrays together by index:
def multiply_list(a1, a2)
  products = a1.zip(a2).map { |pair| pair.inject(:*) }
end

def another_multiply_list(a1, a2)
  products = []
  a1.each_with_index { |num, index| products << num * a2[index] }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

# Problem 9 - Return new sorted Array containing every product combo:
def multiply_all_pairs(a1, a2)
  a1.product(a2).map { |pair| pair.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

# Problem 10 - Return the second to last word:
def old_penultimate(str)
  str.split[-2]
end

def penultimate(str)
  str = str.values if str.class == Hash
  str = str.to_s.chars if str.class == Float || str.class == Integer
  str = str.join(' ') if str.class == Array
  return '' if str.class != String || str.empty?
  str.split[str.split.size/2]
end

p penultimate('Launch School is great!')
p penultimate(', ;as    dsf went go!?:{>{ fod dflk @#$%^&* =-= hi  a   ')
p penultimate('one two THIS four five')
p penultimate('only_one_word_here')
p penultimate('')
p penultimate(456787654)
p penultimate(34_567.66)
p penultimate(['array lets go!'])
p penultimate({ key: 'how about', key2: 'hashes?' })
p penultimate(true)
p penultimate(nil)

=end
