# My first attempt at this calculator before watching the video:

Kernel.puts("Enter your first number:")
first_input = Kernel.gets().chomp()
Kernel.puts("Enter your second number:")
second_input = Kernel.gets().chomp()
Kernel.puts("Which operation do you want? Type 'add', 'subtract', 'multiply', or 'divide':")
operation = Kernel.gets().chomp()

case operation
when "add"
  puts "The result is #{first_input.to_i + second_input.to_i}."
when "subtract"
  puts "The result is #{first_input.to_i - second_input.to_i}."
when "multiply"
  puts "The result is #{first_input.to_i * second_input.to_i}."
when "divide"
  puts "The result is #{first_input.to_i / second_input.to_i}."
end

# During/with the video:

# ask user for two numbers
# ask user for operator
# perform operation
# output result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets()

Kernel.puts("What's the second number?")
number2 = Kernel.gets()

Kernel.puts("What operation would you like ot perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")