### Implement a method to only select certain values from hashes:
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash_input)
  input_keys = hash_input.keys
  counter = 0
  new_hash = {}

  loop do
    break if counter == input_keys.size

    key = input_keys[counter]
    value = hash_input[key]

    if value == 'Fruit'
      new_hash[key] = value
    end

    counter += 1
  end

  new_hash
end

p select_fruit(produce)

### Make this a mutating method:
def multiply!(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size
    
    numbers[counter] *= multiplier

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply!(my_numbers, 5)
p my_numbers

### Transform based on position in the array instead of value:
p '~~~'
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)
p my_numbers

p '~~~'
### Make a new program:
# input: string + selection criteria
# outut: new string of only the characters in the selection criteria
# rules: it must be a method named select_letter

def select_letter(string, selection_criteria)
  new_string = ""
  counter = 0

  loop do
    break if counter == string.size
    if string[counter] == selection_criteria
      new_string << string[counter]
    end
    counter += 1
  end

  new_string
end

question = 'This is an example sentence.'
p select_letter(question, 'e')
p select_letter(question, 't')
p select_letter(question, 'z')
