=begin
PEDAC
  start 1:44
  finish 2:09
  time 25min
Problem
  explicit rules
    take an array and reverse its elements
    mutate the original object and return it, do not create new
    do not use reverse or reverse methods
    reverse the position of the elements, not elements themselves
  implicit rules
    an empty array should return empty
  clarifying questions
    if there are nested arrays, should this reverse their elements as well?
      (assume no based on string example)
    the original array should be the same object, but what about the elements?
      (assume elements must be the same as well)

Examples
  single element string
  empty
  multiple elements (non-palindromic)
    [1, 2, 3, 4]

Data
  input: array
  intermediate:
    original array
    placeholder array
  output: same array, reversed

Algorithm:
  take an array as input
  create placeholder for original objects
  pop elements until array is empty and append them to placeholder array
  add placeholder to original aray and flatten (does merge! keep orig object
=end

def reverse!(array)
  temp_arr = []
  until array.empty?
    temp_arr << array.pop
  end

  array.concat(temp_arr)
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
