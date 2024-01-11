=begin
PEDAC
  start 9:28
  finish 9:40
  time 12min
Problem
  rules
    accept positive integer `n` as an argument
    calculate the sum of the first n positive integers and square it `sum_then_square`
    calculate the sum of the squares of the first n positive integers `square_then_sum`
    return the difference between sum_then_square and square_then_sum
Data:
  array of first n integers (1..n.to_a)
  transformation of array to value in one line
Algorithm
  create array of integers
=end

def sum_square_difference(n)
  integers = (1..n).to_a
  sum_then_square = integers.sum.pow(2)
  square_then_sum = integers.map { |int| int.pow(2) }.sum
  sum_then_square - square_then_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
