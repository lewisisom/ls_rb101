require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
def messages(message, lang='us')
  MESSAGES[lang][message]
end
LANGUAGE = 'us'

def format(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def valid_number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s || num > num.to_f.to_s
end

def operation_to_message(op)
  a =   case op
        when '1'
          'Adding'
        when '2'
          'Subtracting'
        when '3'
          'Multiplying'
        when '4'
          'Dividing'
        end
  a
end

number1 = 0
number2 = 0
operator = 0
username = ''

format('welcome')

loop do
  username = gets.chomp
  if username.empty?
    format('valid_name')
  else
    break
  end
end

format('hi')

loop do
  loop do
    format('first_number')
    number1 = gets.chomp
    break if valid_number?(number1)
    format('invalid_number')
    next
  end

  loop do
    format('second_number')
    number2 = gets.chomp
    break if valid_number?(number2)
    format('invalid_number')
    next
  end

  format('operator_choice')

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      format('operator_error')
    end
  end

  format("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  format('result')

  format('another_calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

format('goodbye')
