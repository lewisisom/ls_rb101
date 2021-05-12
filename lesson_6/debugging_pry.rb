require 'pry'

a = [1, 2, 3]
binding.pry
a = a.map { |num| num += 5 }
binding.pry
p a.first
binding.pry

# I watched the whole video on the lesson page, and played around in
# irb and pry on the command line. https://launchschool.com/lessons/de05b300/assignments/f9bd863d
