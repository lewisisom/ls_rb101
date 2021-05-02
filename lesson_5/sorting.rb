# We have this- [2, 5, 3, 4, 1]
# We want this, sorted array- [1, 2, 3, 4, 5]
p [2, 5, 3, 4, 1].sort # Boom.

# What we do need to understand though is the way in which sort
# applies criterion in order to return an ordered collection.

# <=> spaceship operator- returns -1, 0, or 1.
p 2 <=> 5 # -1
p 6 <=> 6 # 0
p 5 <=> 4 # 1
p "hello" <=> 'hel' # 1
p nil <=> false # nil
p :five <=> 'five' # nil

p [1, 3] <=> [2, 2] # -1
p [3, 1] <=> [2, 2] # 1

p ['arc', 'bat', 'cape', 'ants', 'cap'].sort
# ['ants', 'arc', 'bat', 'cap', 'cape']

p [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', cat', 'b', 'c'], [['b', 2]]

# We stated previously that there generally isn't a need to sort hashes, since hash values are
# accessed via their keys rather than position. If you did want to sort a hash
# however, calling sort_by on it would be a way to do so.

# Look at https://ruby-doc.org/core-3.0.0/Enumerable.html#method-i-sort
# for sort and sort_by
