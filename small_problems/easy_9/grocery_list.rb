=begin
PEDAC
  start 315
  finish 319
  time 4 min
Problem
  rules
    accept a grocery list as an array of nested arrays
      nested arrays contain the item and needed count
    create a new array with one item for every count in the array such that
      [[bananas, 2], [apple,1]] => [bananas, bananas, apple]
=end

def buy_fruit(list)
  list.to_h.map { |key, value| [key] * value }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]