# Question 1 - ASCII Art, one space indent extra per line:
counter = 0
loop do
  break if counter == 10
  puts (' ' * counter) + 'The Flintstones Rock!'
  counter += 1
end
# I completed the problem, but I used more than 1 line.
# Honestly it's good even though it's 6 lines. It's good.
# Here's the 1-liner solution, it is in fact better:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2 - Why error, how fix?
# puts "the value of 40 + 2 is " + (40 + 2)
# (40 + 2) is an integer and you're trying to shove it into a string!
# Fix #1 is to call .to_s on (40+2) after it's been evaluated to 42
puts "the value of 40 + 2 is " + (40 + 2).to_s
# Fix #2 is to interpolate it within the quotes using #{}
puts "the value of 40 + 2 is #{40+2}"

# Question 3 - Change it so it doesn't raise an exception:
def factors(number)
  divisor = number
  factors = []
  loop do # Changed begin/end/until to a loop, changed == 0 check to <=0 and put it at the beginning
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end # End of edit
  factors
end
p factors(0)
p factors(6)
p factors(-999)
# BONUS 1
# The purpose of the number % divisor == 0 is to see if that specific divisor
# is a factor or not. If the statement is true, it's a factor, otherwise, not.
# BONUS 2
# To make sure the output of the method is the array of factors.
# It's the final thing in the method so it will be the return value.

# Question 4 - Determine difference:
# I did some tmp testing here to try to figure stuff out.

# Question 5 - What's wrong?
# Lines 4-7, in the while loop, have wrong logic.
# Specifically, lines 6-7 have whacky variable reassignment.
# first_num = second_num should come after second_num = sum, perhaps?
# WAIT WAIT WAIT IT'S THE LIMIT VARIABLE- On line 4, on the while 
# statement, limit is put there, but the method doesn't know what
# it is. If you make an extra input space in the method fib for that 
# value then use that instead it shouldn't raise a undefined variable
# error message.
# Fix- 2 things-
# Change `def fib(first_num, second_num)` to `def fib(first_num, second_num, limit)`
# Change `result = fib(0, 1)` to `result = fib (0, 1, limit)`
p '---------'
limit = 15
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6 - What's my output?
# 34
# Pretty straightforward. Only lines 1 and 9 are actually used.

# Question 7 - Changed?
# Everything seems correct- I has a look at what .values.each do
# and stuff does and it seems like the family's data got ransacked, 
# but, actually, since += and = are non-mutating then nope. It's all good.
# mess_with_demographics(musters) will successfully output garbage, 
# but if you then just do p musters afterwards you'll see that musters 
# was not mutated by that method.
# NO, IM COMPELTELY WRONG, READ THE OFFICIAL SOLUTION.

# Question 8 - What's the result of this super complex input?
# puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# puts rps(rps("paper", "rock"), "rock")
# puts rps("paper", "rock")
# puts "paper"
# paper

# Question 9 - What's the reutrn value of this invocation?
# "no"
# Does (foo = "no") == "no" ? Well, no, it does not equal that.
# I'M WRONG AGAIN. THIS EXAMPLE USES THE FIRST METHOD. Basically,
# if both foo and bar are methods, then if you do bar(foo) then you're
# plugging in the return value of the method foo as the input 
# to bar - and since the return value of the foo method is "yes",
# then when you go to line 6 you're asking "yes" == "no" ?