=begin
PEDAC
  start 4:08
  finish 4:23
  time 15min

Problem
  explicit rules
    take two array as arguments
    put all unique elements across both arrays into a new array
    return the new array
  implicit rules

  clarifying questions
    return a new array object? (yes)
    if one argument contains duplicates (but none in the 2nd), should those also be unique (yes)
    uniqueness by value or object? (assume value)
    empty arrays return an empty array? (yes)
    assume a nested collection as a value? (no)
    do we want any sorting of final array? (no)

Examples:
  integers
  empty
  string

Data
  input: two arrays, potential duplicates within and across them, none are collections
  intermediate:
    third array to capture output
  output: single array of unique values

Algorithm
  #simple way
    concat the uniq output from each arg

  #hard way
  create new array
  for first array
    for each element
      push to new array if new array doesnt include it

  for second array, repeat
=end

#Simple way
def merge(array1, array2)
  (array1 + array2).uniq
end

# Hard way
def merge(array1,array2)
  new_array = []
  array1.each { |element| new_array << element unless new_array.include?(element) }
  array2.each { |element| new_array << element unless new_array.include?(element) }

  new_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]