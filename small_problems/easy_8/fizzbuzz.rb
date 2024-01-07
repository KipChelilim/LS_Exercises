=begin
PEDAC
  start 1100
  finish 11:18
  time 18min
Problem
  rules
    accept two integers as arguments
      first integer is a starting number
      second integer is an ending number
    print all numbers between the start and ending numbers, inclusive
      if a number is divisible by 3 only, print Fizz
      if a number is divisible by 5 only, print Buzz
      if a number is divisible by 3 and 5, print FizzBuzz
      otherwise print the number

Example: use provided example 1, 15 to cover all below
  3 => 3
  5 => 5
  both => 15
  none => 1
Data
  input: two integers
  intermediate:
    integer iteration
  output: integers
Algorithm
  create range from 1 to 15
  transform elements based on fizzbuzz rules
    FizzBuzz if the number is divisible by both 3 and 5 put
    Fizz     if               divisible by 3
    Buzz     if               divisible by 5
    number   in all other cases
  join array and print result
Idea bank
=end

def divisible_by(num)

end


def fizzbuzz(starting_num, ending_num)
  result = (starting_num..ending_num).map do |num|
    if num % 5 == 0 && num % 3 == 0
     "FizzBuzz"
    elsif num % 5 == 0
     "Buzz"
    elsif num % 3 == 0
     "Fizz"
    else
     num
    end
  end
  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz