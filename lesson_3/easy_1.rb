# Question 1 - Output:
# 1
# 2
# 2
# 3
# .uniq doesn't mutate.

# Quesiton 2 - ! vs ? difference:
# ! is a not operator, as in !=
# ? is a binary question, it outputs either true or false, as in .odd?
# ! after a method thingy like .uniq! means that operation is mutating
# ? before a variable returns a string version of it
# ? after a method name is just part of the method name, by
# convention, means a binary output method
# !! returns the boolean equivalent of the object
# ! before an object is the same as !!, except reversed output

# Question 3 - Replace word in string:
advice = "Few things in life are as important as house training your pet dinosaur."
# advice[6] = 'urgent' <--- Sadly, doesn't work
# -----------------
# advice_array = advice.split(' ')
# advice_array[6] = 'urgent'
# advice = advice_array.to_s
# puts advice
# ^^^^^ Super bad solution ^^^^^
advice.gsub!('important', 'urgent')
puts advice

# Question 4 - .delete_at vs .delete for Array:
numbers = [1, 2, 3, 4, 5]
# Right now, to my knowledge, they're identical
numbers.delete_at(1)
puts numbers
numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
puts numbers
# After running this test I now believe
# .delete_at() is the position of the deletion and
# .delete() is what item you want to delete
# .delete_at(0) means get rid of the very first element in the array
# .delete(0) means remove the number '0' as an element from the array

# Question 5 - Determine 42 is between 10 and 100:
# 42.range?(10, 100) <---- My 'psuedo code' before I knew the syntax
puts (10..100).include?(42)

# Question 6 - Add to this string, two methods:
famous_words = 'seven years ago...'
famous_words.insert(0, 'Four score and ')
puts famous_words
famous_words = 'seven years ago...'
tmp_variable = 'Four score and '
famous_words = tmp_variable << famous_words
puts famous_words
# Can also do
# famous_words.prepend('Four score and ')
# So much better

# Question 7 - Turn into non-nested array:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten!

# Question 8 - Only Barney's name and number:
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
barney_info = flintstones.assoc("Barney")
p barney_info
puts barney_info
# Had no idea .assoc existed