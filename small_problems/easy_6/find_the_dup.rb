=begin
PEDAC
  start 5:03
  finish 5:18
  time 15min

Problem
  explicit rules
    accept an unordered array as an input
      exactly one value in this array is a duplicate
    find the duplicate value and return it
    assume there is for sure a duplicate
  implicit rules

  clarifying questions

Examples
  [1, 5, 4, 1]

Data
  input: array containing one value as a duplicate
  intermediate: second deduped array, both array sorted
  output: single value, the duplicate

Algorithm
  create a temp array of only uniq values from input
  check the values from each array at the same index and return the first value thats not the same
=end

def find_dup(array)
  unique_array = array.uniq
  array.each_with_index do |element, idx|
    return element if array[idx] != unique_array[idx]
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73