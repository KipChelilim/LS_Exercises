=begin
PEDAC
  start 804
  finish 820
  time 16min
Problem
  rules
    calculate a fibonacci sequence without recursion
Examples
  1 [1]
  2 [1, 1]
  3 [1, 2]
  4 [2, 3]
Data
  iterator from 3 up to nth
  variable for current number
  variable for prior num
Algorithm
  start with an array [1, 1]
  iterate from 3 up to nth
    3:
      remove first number => [1], curr_num == 1
      add it to last number => 1 + curr_num = 2
      append to the array => [1, 2]
    4:
      remove first number => [2], curr_num == 1
      add it to last number => 2 + curr_num = 3
      append to the array => [2, 3]
  return last
=end

def fibonacci(n)
  curr_sequence = [1, 1]
  3.upto(n) do |n|
    curr_sequence << curr_sequence.shift + curr_sequence.last
  end
  curr_sequence.last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001).to_s[0,10] == "4202692702"
p fibonacci(100_001).to_s[-19..-1] == "8285979669707537501"