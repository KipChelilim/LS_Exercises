=begin
PEDAC
  start 7:23
  finish 7:36
  time 13min
Problem
  explicit rules
    take an array of 1 or more numbers
      assume non-empty array
    calculate a running total for each element of the array
    then calculate a total of the running total
    return the final total
  implicit rules
    return value should be single value
  clarifying questions
    assume numbers == integer and float values only? yes, integer only
Example: covered by examples
  1 element
  multiple elements
Data
  input: array of 1 or more integers
  intermediate:
    running total variable
    array to capture running totals
  output: integer return value representing sum of running totals
Algorithm
  for each element calculate a running total
  put the running totals as of each element into a new array
  sum the values from the running totals array
  return the sum
Idea bank
=end

def sum_of_sums(array)
  running_total = 0
  array.map { |num| running_total += num }.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
