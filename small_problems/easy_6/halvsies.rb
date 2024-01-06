=begin
PEDAC
  start 4:38
  finish 4:58
  time 20min

Problem
  explicit rules:
    accept a single array as argument
    return a single array with 2 nested arrays
    each nested array should contain the first half and second half of the argument
    default the middle element (for odd numbered arrays) to the first half

  implicit rules
    order does not matter, no sorting taking place
    if there arent enough elements, 1st or 2nd array should be empty
      (e.g. single element array input -> nested array 2 is empty
      (e.g. empty array input -> both empty)
  clarifying questions
    should we return a new array? (assume yes)
    expect nested arrays in the input?

Examples (all covered below)
  empty
  single
  even
  odd

Data:
  input: single array
  intermediate:
    variable for index limit
    new array with 2 inner arrays
  output: 2-element array composed of 2 nested arrays

Algorithm:
  if input is empty, return empty array
  if input is size 1, return new array with single digit and empty nested array
  else
    figure out `first_half` from the input
      size is even => array.size/2
        [1, 2, 3, 4] => first_half is 4/2 == 2
          [1, 2], [3, 4]
      size is odd => add 1
        [1, 2, 3, 4, 5] => first_half is 4/2 + 1 == 3 (test for round up method in refactor)
          [1, 2, 3], [4, 5]
    get a slice of size `first_half` from the start up to the index limit and put it as `new_array[0]`
    get a slice of the remaining array and put it as `new_array[1]`
    return new array
=end

def halvsies(array)
  case array.size
  when 0 then return [[],[]]
  when 1 then return [array,[]]
  end

  first_half_size = array.size / 2
  first_half_size += 1 if array.size.odd?

  first_half = array[0,first_half_size]
  second_half = array - first_half

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]