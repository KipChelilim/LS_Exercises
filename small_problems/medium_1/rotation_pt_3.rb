=begin
PEDAC
  start 1033
  finish 1100
  time 27min
Problem
  rules
    accept an integer as an argument
    calculate the maximum rotation of the number
      rotate first digit, then freeze it
      rotate the now 2nd digit, then freeze
      rotate the now 3rd digit..
      etc
    return the new value
    drop leading zeroes in the final number
  clarifying questions:
Examples
  single digits no change 3 => 3
  2 digits => switch
  3 or more => 0 and even indicies are added to the end
Data
  input: integer
  intermediate:
    array for digits
  output: integer
Algorithm
  set (size of string) to `n_digits`
    size == 6
  call right most with string for first rotation
    735291 => 352917
  until n_digits < 1
    decrease `n_digits` by 1
      n_digits = 5
    call rotate `n_digits` with result and assign to result
      First iteration: 352917, -5 => 329175
      Second 329175, -4 => 321759
    return results
=end

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(number, r_index)
  digits = number.abs.digits.reverse
  digits[-r_index..-1] = rotate_array(digits[-r_index..-1])
  result = digits.join.to_i
  result * (number.positive? ? 1 : -1)
end

def max_rotation(number)
  n_digits = number.digits.size
  until n_digits < 2
    number = rotate_rightmost_digits(number, n_digits)
    n_digits -= 1
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845