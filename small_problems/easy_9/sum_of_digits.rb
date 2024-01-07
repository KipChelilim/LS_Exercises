=begin
PEDAC
  start 401
  finish 402
  time 1 min
Problem
  rules
    take a positive integer
    return the sum of its digits
=end

def sum(int)
  int.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45