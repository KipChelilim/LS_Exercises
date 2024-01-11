=begin
PEDAC
  start 802
  finish 848
  time
Problem
  rules
    take a single integer as an argument
    identify the next featured number greater than the argument
      - odd number
      - multiple of 7
      - digits occur exactly once each
      - has to increment by 14
          incrementing an odd number by an odd number results in even number
          need an even multiple of 7
      - 9876543201 largest possible featured number
        cant be larger than 10 digits or you would repeat digits
        9876543210 is largest 10 digit number with unique digits
        next lowest odd multiple of 7 comes from swapping the last two digits
          9876543210 % 7 == 2 => multiple of 7 == 9876543208 => odd multiple ...201
    return either:
      the next featured number greater than the argument, OR
      an error if there is no next featured number
Examples
  featured number definition:
    49 yes
    98 no
    133 no
    9876543208

Data
Algorithm
  take number and calculate next odd multiple of 7
    number + 7 - (number % 7) (examples 7, 13)
      7:   7 + (7 - 7  % 7) =>  7 + 0   =>  7
      13: 13 + (7 - 13 % 7) => 13 + 7-6 => 14
    if number is even add 7
      21
      21
  run a loop
    break if number.digits.uniq.size == number.digits
    number + 14
=end

def featured(num)
  num += 7 - (num % 7)
  num += 7 if num.even?

  num.step(to: 9876543208, by: 14) do |curr_num|
    return curr_num if curr_num.digits.uniq.size == num.digits.size
  end
  "There is no possible number that fulfills those requirements"
end

p featured(7) == 21
p featured(9876543202) == 'There is no possible number that fulfills those requirements'
p featured(13) == 21
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) == 'There is no possible number that fulfills those requirements'