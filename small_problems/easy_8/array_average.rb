=begin
PEDAC
  start 129
  finish 1:34
  time 5min
Problem
  rules
    accept an array containing one or more positive integers
    calculate the average of all numbers in the array
    return the average as an integer
Examples
  one value
  many values
Data
  arrays and int
Algorithm
  calculate sum of integers in the array (inject)
  divide by count of elements in the array ( / .size)
idea bank
=end

def average(array)
   array.inject(1.0, :+) / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40