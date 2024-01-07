=begin
PEDAC
  start 7:38
  finish 7:50
  time 12min
Problem
  explicit rules
    accept a string value
    identify all substrings that start at the beginning of the original string
    return a list of those substrings ordered from shortest to longest
  implicit rules
    return value is an array
    get slices of substring starting with slice size 1 and increasing til string.size
  clarifying questions
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
  output: return array containing substrings or empty if string is empty
Algorithm
  create array placeholder
  for each index of the string (size .times, use times block parameter)
    get a slice of string from 0..index
      ex: 'abc'
      1: index 0 => string[0..0] => a
      2: index 1 => string[0..1] => ab
      3: index 2 => string[0..3] => abc
  append the substring to the end of the array
  return resulting array
Idea bank
=end

def leading_substrings(string)
  substrings = []
  string.size.times { |idx| substrings << string[0..idx] }
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
p leading_substrings('') == []