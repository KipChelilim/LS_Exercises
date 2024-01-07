=begin
PEDAC
  start 145
  finish 207
  time 22min
Problem
  rules
    accept single number as input
    identify if a number is a double number
      must have an even number of digits (e.g. 10..99, 1000..9999, etc)
      left side digits must be the same as right side digits (e.g. 99, 103103)
        i.e. first half repeats
    if its a double number, return the number
    if its not, return the number doubled
  clarifying rules:
    will all inputs be integers? assume yes
Examples
  103103
  334433
  111
Data:
  integer converted to string for detecting double number
  integer for calculations
Algorithm
  check if a number is a double number (separate method `double_number?`)
    convert to string
    return false if string size is odd or even
    test whether slice of first half of the string doubled equals string
    if test is true return true else false
  if true set placeholder to 1 otherwise 2
  return result of multiplication
=end

def double_number?(num)
  num_string = num.to_s
  return false if num_string.size.odd?
  (num_string.slice(0, num_string.size / 2) * 2) == num_string
end

def twice(num)
  multiplier = double_number?(num) ? 1 : 2
  num * multiplier
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
