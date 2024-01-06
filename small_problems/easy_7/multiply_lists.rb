=begin
PEDAC
  start 241
  finish 253
  time
Problem
  explicit rules
    accept two arrays containing lists of numbers
    calculate the product of each pair of numbers (same index) from the arguments
    assume arguments contain the same number of elements
    return new array containing just the products
  implicit rules
    none
  clarifying questions
    will all values be integer or float? (assume int - important incase of other numeric types, etc)
    will there be empty arrays? (assume no)
    if there are other numeric types, should they match their inherent type or converted to int

Example - covered by example provided
  any float or integer value
  no other significant variations
Data
  input: two arrays of equal size, containing integers
  intermediate:
    array of pairs
    array to capture outputs
  output: single array, containing products of array1[n] * array2[n] as integers?
Algorithm
  take two arrays
  combine to a single array pairs nested inside (zip)
  for each pair, transform it to the product of its elements (map)
  return resulting array (result from map)
Idea bank
=end

def multiply_list(array1, array2)
  array1.zip(array2).map { |pairs| pairs.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]