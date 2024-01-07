=begin
PEDAC
  start 241
  finish 241
  time
Problem
  rules
    accept an integer argument greater than 0
    return an array containing each number from 1 to argument
=end

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]