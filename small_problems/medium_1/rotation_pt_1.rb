=begin
PEDAC
  start 1001
  finish 10:08
  time 7min
Problem
  rules
    take an array argument
    move the first element of the array to the end
    do not modify the original array
    do not use the #rotate or #rotate! methods
    return a new array
    single element arrays should return themselves
  clarifying questions
    should empty arrays return an empty array? assume yes
Examples
  empty - []
  1 element - ['a']
  many - covered by provided examples
Data
  input: array of zero or more elements
  intermediate:
    new array
  output: new array
Algorithm
  return array if size is less than 2
    [] =>
    ['a'] =>
  get a slice of the array, skipping the first element
    [1 2 3 4] => [2 3 4]
  push the first element from org array to the slice
    [2 3 4] + [1]
  return it
=end

def rotate_array(array)
  return array if array.size < 2
  array[1..-1] << array[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true