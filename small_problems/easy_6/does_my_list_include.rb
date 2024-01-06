=begin
PEDAC
  start
  finish
  time

Problem
  explicit rules
    accept an array as argument and a specific value
    search each element of input array for the value
    return true if the value is included in the array
    do not use the built in include method
  implicit rules
    empty arrays are acceptable
  clarifying questions
    none

Examples
  see examples from problem

Data
Algorithm:
  for each element in the array
    check if it is equal to the argument `value`
    return true if it is
  otherwise return false
=end

def include?(array,value)
  array.each { |element| return true if element == value }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false