=begin
PEDAC
  start 5:55 /
  finish 6:01 /
  time 6 min
Problem
  explicit rules
    accept a string as an argument
      string contains words delimited by blank characters
      assume the string will always have at least two words
    identify the 2nd to last word and return it
  implicit rules
  clarifying questions
    returning a new string? yes
    include punctuation / non-alphabetic characters attached to word? yes
Examples
  two or more words -> covered by example
Data
  inputs: string with words delimited by spaces
  intermediate:
    array of words, slice for desired output
  outputs: word as a single string return
Algorithm
  split string into words
  get slice of word at index -2
Idea bank
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'