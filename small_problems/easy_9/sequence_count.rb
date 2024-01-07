=begin
PEDAC
  start 251
  finish 301
  time 10min
Problem
  rules
    accept two integers as arguments, pos, neg or zero
      first argument is a `count`
      second argument is the first number in a sequence `first_num`
    create an array of size `count`, starting with `first_num`
      where element is a multiple of `first_num`
=end

def sequence(count, first_num)
  return [first_num] * count if first_num == 0
  first_num.step(by: first_num, to: first_num * count).to_a
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []