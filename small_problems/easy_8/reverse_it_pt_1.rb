=begin
PEDAC
  start 103
  finish 108
  time 5 min
Problem
  rules
    accept a string argument
    reverse the order of the words
    return a new string with new order
    words delimeted by one or more spaces
    empty string or string of all spaces should return empty string
  clarifying questions

Examples
  empty
  spaces
  single word
  multiple words
Data
  input: string of words delimited by spaces
  intermediate:
    array of words
  output: sentence of words reversed, as string object returned from method
Algorithm
  split string into words
  reverse the order of the words
  re join the string and return it
Idea bank
=end

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''