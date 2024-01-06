=begin
PEDAC
  start 5:39
  finish 5:53
  time 14min
Problem
  explicit rules
    accept two non-empty arrays of numbers
    calculate the product of every pair of numbers between the two elements
    return an array containing the resulting products, sorted in ascending value
  implicit rules
    combinations, not permutations
    arrays can be of different sizes
  clarifying questions
    assume integer and float types? yes
      if so, should resulting value in return array match result from calculation? yes
        e.g. int x float == float, do not convert to int
    assume the values will aways be proper numeric objects? yes
Examples
  array1 size 2, array2 size 4 => resulting array size 8 (covered by provided example)
Data
  inputs: two arrays, containing int or float values, non empty
  intermediate:
    array with all combinations, then transformed to product
  output: array of resulting products
Algorithm
  take two arrays and return new array containing combinations of elements, nested (product)
  transform array and multiple elements of each inner array (map & inject)
  sort array
  return resulting array
Idea bank
  -test combination method to make sure expected output is right
    -not combination  #* method
=end

def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |pair| pair.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]