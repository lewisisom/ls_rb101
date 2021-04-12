def format(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s || num > num.to_f.to_s
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

number1 = 0
number2 = 0
operator = 0
username = ''

format("Welcome to Calculator! Enter your name:")

loop do
  username = gets.chomp
  if username.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

format("Hi #{username}!")

loop do
  loop do
    format("What's the first number?")
    number1 = gets.chomp
    break if valid_number?(number1)
    format("Invalid number. Only numbers are allowed. Either integers or floats. Please try again.")
    next
  end

  loop do
    format("What's the second number?")
    number2 = gets.chomp
    break if valid_number?(number2)
    format("Invalid number. Only integers are allowed. Please try again.")
    next
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  format(operator_prompt)

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      format("Must choose 1, 2, 3, or 4")
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

  format("The result is #{result}")

  format("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

format("Thank you for using the calculator. Good bye, #{username}!")
