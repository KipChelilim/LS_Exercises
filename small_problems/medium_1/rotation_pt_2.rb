=begin
PEDAC
  start 1010
  finish 10:26
  time 16min
Problem
  rules
    accpet a number as an input
    rotate the last `n` digits where n is a positive integer
  clarifying questions:
    will the input always be an positive integer as shown in the examples? assume integer
Examples:
  735291, n == 1 => 735291 no change
  735291, n == 2 => 735219 2nd to last number moved
  735291, n == 6 => 352197 first number moved
Data:
  input: integer (pos or negative or zero)
  intermediate:
    array for digits?
    or string for slicing
  output: number in same format
Algorithm:
  get the individual digits of the number
  move the nth digit counting in reverse to the back of the number
    slice from nth digit to end as right_side, save remaining as left side
    rotate right_side using rotation method
    recombine digits
  return the number
=end

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(number, r_index)
  digits = number.abs.digits.reverse
  right_side = digits[-r_index..-1]
  left_side = digits - right_side

  right_side = rotate_array(right_side)
  result = (left_side + right_side).join.to_i
  result * (number.positive? ? 1 : -1)
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

p rotate_rightmost_digits(-735291, 1) == -735291
p rotate_rightmost_digits(-735291, 2) == -735219
p rotate_rightmost_digits(-735291, 3) == -735912
p rotate_rightmost_digits(-735291, 4) == -732915
p rotate_rightmost_digits(-735291, 5) == -752913
p rotate_rightmost_digits(-735291, 6) == -352917
