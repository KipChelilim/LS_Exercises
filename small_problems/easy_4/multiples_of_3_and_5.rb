=begin
PEDAC start 330 345
Problem
  # explicit rules:
  #   find all multiples of 3 or 5 between 1 and the provided number
  #   then add the sum of those multiples
  #   assume an integer greater than 1 is argument
  # implicit rules:
    # inclusive of supplied number

  # clarifying questions

Examples:
  # 3
  # 5
  # 6 => multiple of 3
  # 10 => multiple of 5
  # 8 => non multiple, but range inclusive of multiples
  # 2 => non multiple, range not inclusive of multiples

Data
  # inputs: single integer value
  # intermediate:
  #   range of values between 1 and supplied limit (array?)
  #   array to hold multiples
  # outputs: single integer value

Algorithm
  # take integer value as `limit`
  # get range of values from 1 to `limit` (range to_a, or times
  # iterate over range and pass all values that are multiples to another array (times or each on array)
  # sum the array and return the result

Code
=end

def multisum(limit)
  multiples = []

  limit.times do |number|
    number += 1
    multiples << number if (number % 3 == 0) || (number % 5 == 0)
  end

  multiples.sum
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(6) == 14
p multisum(10) == 33
p multisum(8) == 14
p multisum(2) == 0
p multisum(1000) == 234168
