=begin
PEDAC
  start 7:52
  finish 8:11
  time 19min
Problem
  explicit rules
    accept a string argument
    identify all subtrings in the string
    order the list by starting position of the substring in original string
    return list sorted
    use leading_substrings method from before
  implicit rules
    return all substrings starting from index 0, then all from index 1,...etc
    assume same rules from prior:
      return value is an array
      get slices of substring starting with slice size 1 and increasing til string.size
  clarifying questions: same as prior
    results for empty string? assume empty array
    substrings include all character types? assume yes
Examples
  empty
  1 letter
  more than 1
Data
  input: single string, possibly empty
  intermediate:
    array to capture substrings
    string slices
  output: return array containing all substrings or empty if string is empty
Algorithm
  create array to capture substrings
  for each index in string (times)
    get a substring from current index to end of string (string[idx..-1])
    call `leading_substring` with the above substring
    pass return into an array
  flatten array and return
idea bank
=end

# def leading_substrings(string)
#   substrings = []
#   string.size.times { |idx| substrings << string[0..idx] }
#   substrings
# end

# def substrings(string)
#   result = []
#   string.size.times { |start_idx| result << leading_substrings(string[start_idx..-1]) }
#   result.flatten
# end

def substrings(string)
  results = []
  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      results << string[start_idx..end_idx]
    end
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('') == []