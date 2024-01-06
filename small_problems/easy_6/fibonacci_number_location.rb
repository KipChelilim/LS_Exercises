=begin
PEDAC
  start: 9:06
  finish: 9:29
  time: 23min

Problem
  explicit rules:
    accept an integer representing a number of digits
    identify the index of the first number with that many digits
      from an array whose elements represent the fibonacci series
    the first fibonacci number has index 1, such that index position 0 should return 1
    assume the digit size is always >= 2
  implicit rules
    return the size of the array once the sequence is reached
  clarifying questions
    none
Examples:
  2 digits => once sequence >= 100 => >= 10**(n-1)
      0 1 2 3 4 5  6
     [1 1 2 3 5 8 13] => size == 7 -> return 7 but index is 6
  3 digits =>
     0 1 2 3 4 5  6  7  8  9 10  11
    [1 1 2 3 5 8 13 21 34 55 89 144]  => size == 12 -> return 12, but index is 11

Data
  input: integer, # of digits in final number
  intermediate:
    array for sequence
    limit for sequence -> when last # == 10
  output: integer, array size

Algorithm
  create array for sequence with values [1, 1]
  `sequence_limit` = 10**(digits-1)
  add next number in sequence to the array
    push array[-2] + array[-1] until array.last >= limit
  return size of the array once desired number of digits has been reached
=end

def find_fibonacci_index_by_length(digits)
  sequence = [1, 1]
  sequence_limit = 10**(digits-1)
  until sequence.last >= sequence_limit
    sequence << (sequence[-2] + sequence[-1])
  end

  sequence.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847