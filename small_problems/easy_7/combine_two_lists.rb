=begin
PEDAC
  start 7:07
  finish 7:15
  time
Problem
  explicit rules
    accept two arrays as arguments
    create a new array containing all elements
    alternate each element from passed in arrays
      e.g. arr1[1], then arr2[1], then arr1[2],....
    assume both inputs are non-empty and have the same size
  implicit rules
    none
  clarifying questions
    none

Example
Data
Algorithm
  get number of elements from one of the inputs (n)
  n number of times
    append array1[n] to return array
    append array2[n] to return array
  return final array
=end

def interleave(array1, array2)
  new_array = []
  array1.size.times do |idx|
    new_array << array1[idx]
    new_array << array2[idx]
  end

  new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']