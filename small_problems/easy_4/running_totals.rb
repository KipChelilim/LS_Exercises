=begin
PEDAC start 349, finish 359

Problem
  # explicit rules
    # take an array and calculate a running total with each element
    # return an array with each element equal to running total sum
      of corresponding element from input array
    # inputs will be array of numbers
  # implicit rules
    # empty array should return an empty array
    # input should be an array containing integers
  # clarifying questions
    # non integer/array inputs => assume no, all will be int in arrays

Examples
  # see below

Data
  # input: array of int
  # intermediate: array transformation, variable to  capture running total
  # output: array of int

Algorithm
  # take array and iterate over each element
  # for each element, add its value to a `running_total` variable
  # push the current running total to a new array at corresponding index
  # return the resulting array

Code
=end

def running_total(integer_array)
  running_total = 0

  integer_array.map do |number|
    running_total += number
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []