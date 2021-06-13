# Advanced 1 Problem # 1 Madlibs Revisited

# - we're making a madlibs generator
# - the input is a txt file called madlib_me.txt
# - the output is printing to the console the
# text file but every word in [] brackets is replaced
# by a random word in that list, so [noun] will be
# replaced by a random noun in a list
# - we will have a seperate data structure for each, and will
# all be arrays, named adverbs or adjectives, etc.
# - we need a way to randomly select a word from an array
# - we will make a ruby method called madlib
# - we will have an array for every word in the madlibs
# text file input, creating by importing it and using
# a string split method, and we will call this words
# - we will iterate through every word in words
# and if there are no brackets, move on to the next word,
# if there are, look up the correct reference table
# and select a random element from it, for example,
# if we run across [name], we will do name_list.random
# - this iteration will modify the array
# - to make it display nicely, we will comibine words array
# into one string, then break it up every 70 characters,
# then print out each line
# - make sure to preserve space characters when breaking
# up and joining the words array
# - we will have a method called madlib with one parameter,
# a string as input, and we return a new string object
# - we will call this method with a variable we assign
# to the input text file. we'll call this madlib
# - that's it program done

nouns = File.read('/home/lewis/ls_rb101/small_problems/nouns.txt').gsub(/[\t\n\r]/, ' ').split
adjectives = File.read('/home/lewis/ls_rb101/small_problems/adjectives.txt').gsub(/[\t\n\r]/, ' ').split
verbs = File.read('/home/lewis/ls_rb101/small_problems/verbs.txt').gsub(/[\t\n\r]/, ' ').split
adverbs = File.read('/home/lewis/ls_rb101/small_problems/adverbs.txt').gsub(/[\t\n\r]/, ' ').split
# These word lists are taken from https://icebreakerideas.com/mad-libs.

story = File.read('/home/lewis/ls_rb101/small_problems/story.txt').gsub(/[\t\n\r]/, ' ').split

def madlib(text)
  text.map do |word|
    next unless word.start_with?('[')
    case
    when word.start_with?('[noun]')
      # replace the [x] part with [x].random
    when word.start_with?('[adjective]')
      # replace the [x] part with [x].random
    when word.start_with?('[verb]')
      # replace the [x] part with [x].random
    when word.start_with?('[adverbs]')
      # replace the [x] part with [x].random
    end
  end

  # puts text except break every 70 characters
  # to make a nice column of text for our story
end

madlib(story)
