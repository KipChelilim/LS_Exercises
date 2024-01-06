=begin
PEDAC
  start 210
  finish 222
  time 12min
Problem
  explicit rules
    accept a non empty array of integers
    multiply all values together divide by number to elements in the array
    return the resulting average rounded to 3 decimal places
  implicit rules
    single elements should still be calculated and converted to float
    return a string with value
  clarifying questions
Examples: covered by provided examples
  one element
  multiple
Data
  input: array, non empty, 1 or more integers
  intermediate: single float value, variable to capture size array
  output: float value rounded to 3 places
Algorithm
  take the array and multiply each element (inject, confirm arg structure)
  divide it by the size of the array
  round value to 3 decimals and return (confirm arg structure for round)
Idea bank
=end

def show_multiplicative_average(array)
  product = array.inject(1.0, :*)
  average = ( product / array.size).round(3)
  puts "The result is #{"%.3f" % average}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667