# Problem 1
def ascii_value(string)
  ascii_sum = 0
  string.chars.each { |char| ascii_sum += char.ord }
  ascii_sum
end

p ascii_value('Four score') #== 984
p ascii_value('Launch School') #== 1251
p ascii_value('a') #== 97
p ascii_value('') #== 0

# Problem 2
def time_of_day(minutes)
  while minutes < 0 do minutes += 1440 end # Ensures input is within one day.
  while minutes >= 1440 do minutes -= 1440 end

  hour = (minutes / 60).to_s # Turns input into hours and minutes time format.
  minute = (minutes % 60).to_s

  hour = "0#{hour}" if hour.length == 1 # Ensures there are two digits (00:00).
  minute = "0#{minute}" if minute.length == 1

  hour + ':' + minute # Returns the formatted hour and minute fliiped_sentence.
end

p time_of_day(0) == '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'

# Problem 3
def after_midnight(time)
  hour = time.to_i
  minute = time[-2, 2].to_i

  (hour * 60 + minute) % 1440
end

def before_midnight(time)
  hour = time.to_i
  minute = time[-2, 2].to_i

  (1440 - (hour * 60 + minute)) % 1440
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0

# Problem 4
def swap(sentence)
  flipped_sentence = sentence.split(' ').map { |word| word.reverse }
  sentence = sentence.split(' ')

  counter = 0
  loop do
    break if counter >= sentence.size
    if flipped_sentence[counter].length > 3
      flipped_sentence[counter][1..-2] = sentence[counter][1..-2]
    end
    counter += 1
  end

  flipped_sentence.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Problem 5
def cleanup(words)
  cleaned_words = words.gsub(/[^a-z]/i, ' ')
  words.size.times { cleaned_words.gsub!('  ', ' ') }

  cleaned_words
end

p cleanup("---what's my +*& line?") == ' what s my line '

# Problem 6
def word_sizes(words)
  occurrences = Hash.new(0)

  words.split.each do |word|
    occurrences[word.size] += 1
  end

  occurrences
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Problem 7
def word_sizes(words)
  occurrences = Hash.new(0)

  filtered_words = words.gsub(/[^ a-z]/i, '')

  filtered_words.split.each do |word|
    occurrences[word.size] += 1
  end

  occurrences
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Problem 8
DIGITS = {  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
            5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
            10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
            15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' }

def alphabetic_number_sort(array)
  words = array.map! { |num| DIGITS[num] }
  words.sort.map! { |word| DIGITS.key(word) }
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# Problem 9
def crunch(string)
  chars = string.chars
  counter = 0

  while counter < chars.size
    chars.delete_at(counter) while chars[counter + 1] == chars[counter]
    counter += 1
  end

  chars.join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

# Problem 10
def print_in_box(string)
  if string.length > 76
    puts 'Warning! Maximum message length is 76 characters. Your message will be cut.'
    string.chop! while string.length > 76
  end

  top_and_bottom_rows = "+#{'-' * (string.length + 2)}+"
  middle_rows = "|#{' ' * (string.length + 2)}|"
  text_row = "| #{string} |"

  puts top_and_bottom_rows
  puts middle_rows
  puts text_row
  puts middle_rows
  puts top_and_bottom_rows
end

print_in_box('i-am-a-very-long-message-that-is-going-to-be-well-over-eighty-characters-but-i-dont-care-im-a-rebel')

# Problem 11
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# It will be the same object as the input. There are no new objects being initialized / created within the method.
# WRONG It returns different objects https://launchschool.com/exercises/0c83973d
