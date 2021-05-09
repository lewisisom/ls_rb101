## Digest this:

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

## The .each method is being called on an array with two elements.
## The argument is simply each element in the array, which are both arrays (nested arrays).
## There is a one-line block between the do and end commands.
## The .first method is being called on each sub array. In both iterations, this selects integers.
## Specifically, the integers 1 and 3 are selected.
## There is a puts method being called, which will print two things (1 and 3) to the screen.
## Since puts returns nil, but each's return value is the calling object. It will return the original array.
## Program done.

## Digest this:

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

## The .map method is being called on an array with two elements.
## The argument used is simply each element.
## There are two lines inclosed within the do and end commands.
## The first line of the first iteration calls two methods: puts and .first.
## Since there are only two elements in the calling object, the block will be run exactly twice.
## The .first method is being called on the two elements in the calling object, [1, 2] and [3, 4].
## arr.first evaluates to the integer 1 on the first iteration and the integer 3 on the second iteration.
## The puts method is being called on that, so a string representation of the integer 1 will be printed to the screen, and on the second iteration, a string representation of the integer 3 will be printed.
## Then, on the second line of the block, the same code, arr.first, is used, but without the puts method before it.
## Again, this evaluates to 1 and 3 on the first and second iterations.
## Since this is the final line of the block, the return value of arr.first will be used.
## The return value of .first is simply the single object, so this entire block will have a return value of 1 on the first iteration and this block will have a return value of 3 on the second iteration.
## Since the .map method being called looks at the return value of the block being used, .map will use 1 and 3. The .map method overall outputs an array containing the integers 1 and 3. [1, 3].
## So, in summary, 1 and 3 will be printed to the screen and [1, 3] will be the overall return value.
## The original calling object will not be mutated. [[1, 2], [3, 4]] is preserved.
## Line 1: .map method call ||| Line 1-4: block execution ||| Line 2: puts method call ||| Line 2: .first method call ||| Line 3: .first method call
## Object: the outer array ||| Object: each sub-array ||| Object: each element at the first index of each sub-array ||| Object: each sub-array ||| Object: each sub-array
## Return: new array [1, 3] ||| Return: integers 1 and 3 ||| Return: nil / nothing ||| Return: element at first index of each sub-array ||| element at first index of each sub-array

## Example 4:

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

## A new array called my_arr is being initialized with included values.
## The array my_arr is using to assign itself is being called with a .each method.
## The calling object array for .each has two elements in the array: an array of two integers, and another array of two integers.
## Line 1: my_arr initialization ||| Line 1: .each method call ||| Lines 1-7: outer block execution
## Line 2: .each called on each element || Lines 2-5: inner block execution
## Line 3: if statement comparing each of the innner array's element with integer 5
## Line 4: puts method being called on every element that passes the if statement
## Line 5: closing off if statement with end statement ||| Line 6: closing off inner block execution with end statement
## Line 7: closing off outer block execution with end statement ||| Program Done.
## Line 3: comparison symbol >, run four times, will be ealuated as true 3 times and false 1 time. Returns a boolean. Used by if.
## Return values of methods:
## puts - each element under 5 in each sub-array of the calling object. this is used to be printed to the screen.
## .each (line 1) - the calling object [[18, 7], [3, 12]].
## .each (line 2) - each sub-array, [18, 7] and also [3, 12].
## The value of my_arr will be-- [[18, 7], [3, 12]]
## The output on the screen will be:
## 18
## 7
## 12
## The if statement on line three will be run 4 times, and the
## puts statement inside of that will be run 3 times.

# Example 5:

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

## .map method call (line 1), object [[1, 2], [3, 4]], returns new array [[2, 4], [6, 8]]
## .map method call (line 2), objects [1, 2] and also [3, 4], returns [2, 4] and also [6, 8]
## multiplication * symbol (line 3), objects integer 2 and each integer of each sub-array, returns an integer (the product)
## outer block execution (lines 1-5), object inner block, returns arrays for each inner block execution, two arrays in this case
## inner block execution (lines 2-4), object each integer of each sub-array, returns each product/integer multiplication result.
## What will be printed to the screen?
## 
## What will be the return value of this code?
## [[2, 4], [6, 8]]
## There are 2 blocks, 2 transformative methods, 5 lines of codes, outer block will
## be run 1 time (1 object), and the inner block will be run 2 times (2 array objects).

# Example 6

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

## .select method call (line 1), array with two hashes, new array with
## the elements in the calling object that passed through the inner
## block exxecution.
## .all? method call (line 2), each hash within the calling object array,
## true or false output. 
## boolean == operator (line 3), value at index 0 and key to string,
## true or false output.
## outer execution loop (lines 1-5).
## inner execution loop (lines 2-4). 
## Let's walk through this program. It starts by laying down an array with
## two elements (hashes) and then calls the .select method on them. The
## argument is each hash, so let's just focus on the first hash.
## { a: 'ant', b: 'elephant' } is passed onto the .all? method.
## Here, its arguments are each key, and value. Let's again just consider
## the first iteration- the key is :a and the value is 'ant'.
## On line 3, we're asking a boolean question: Is the first character of
## the value the same as the key turned into a string? In the first
## example, yes, :a turned to string is the same as the first character
## of 'ant', the character 'a'. This outputs a true value. Now, what does
## the .all? method do though? .all? only outputs true itself if all of
## elements return true themselves. So, for the first one, a: and 'ant',
## yes, the boolean operator on line 3 outputs true, but the next iteration
## gives false, ultimately giving false on the first iteration of the big
## original calling object. The second iteration of the outer execution
## gives true. What doe select do? It makes a new array and copies over
## the elements from the original calling object that return true.
## This is what will be printed:
##
## This is what will be returned:
## [{ :c => 'cat' }]
## If .any? was called instead, the return value of select would be:
## [{ :a => 'ant', :b => 'elephant' }, { :c => 'cat' }]

# Example 10:

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

## .map method call (line 1), [[[1, 2], [3, 4]], [5, 6]] --> [[[2, 3], [4, 5]], [6, 7]]
## .map method call (line 2), [[1, 2], [3, 4]] --> [[2, 3], [4, 5]] AND [5, 6] --> [6, 7]
## .map method call (line 6), [1, 2] --> [2, 3] AND [3, 4] --> [4, 5]
## .to_s method call (line 3), [1, 2] --> "[1, 2]" AND [3, 4] --> "[3, 4]" AND 5 --> "5" AND 6 --> "6"
## .size method call (line 3), "[1, 2]" --> 6 AND "[3, 4]" --> 6 AND "5" --> 1 AND "6" --> 1
## boolean == operator (line 3), 6 == 1 --> false AND 6 == 1 --> false AND 1 == 1 --> true AND 1 == 1 --> true
## addition + operator (line 4), 5 + 1 --> 6 AND 6 + 1 --> 7
## addition + operator (line 7), 1 + 1 --> 2 AND 2 + 1 --> 3 AND 3 + 1 --> 4 AND 4 + 1 --> 5
## outer block execution (lines 1-11), [[[1, 2], [3, 4]], [5, 6]] --> [[[2, 3], [4, 5]], [6, 7]]
## middle block execution (lines 2-10), [[1, 2], [3, 4]] --> [[2, 3], [4, 5]] AND [5, 6] --> [6, 7]
## inner block execution (lines 6-8), [1, 2] --> [2, 3] AND [3, 4] --> [4, 5]

## Do not mutate, the collection, you're iterating through.
