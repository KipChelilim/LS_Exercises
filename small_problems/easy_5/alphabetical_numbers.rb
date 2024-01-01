=begin
PEDAC
  start: 2:01
  finish: 2:11
  time: 11min

Problem
  explicit rules
    accept an array of inetegers between 0 and 19 inclusive
    sort the integers based on the english words for each number
    return sorted array of integers

  implicit rules

  clarifying question: return new array or sort the original array? -> new

Algorithm
  create an array with english word for each number
  call sort method on array passed in
  within the block of the sort method, return the array element using integer as index
=end

NUMBERS_IN_ENG = %w(zero one two three four five six seven eight nine ten
                    eleven twelve thirteen fourteen fifteen sixteen seventeen
                    eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |num| NUMBERS_IN_ENG[num] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]