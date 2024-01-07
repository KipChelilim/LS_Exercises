=begin
PEDAC
  start 1234
  finish 1241
  time 7min
Problem
  rules
    accept a string argument
    return a new string containing a duplicate of every character
    duplicates should follow the org character
    include special characters like punctuation and spaces
    return new string as string
    return an empty string if empty string provided
  clarifying questions:
    empty yes
    new yes
Example
  Hello => HHeelllloo
Data
  input: string
  intermediate: array of characters
  output: string
Algorithm
  create placeholder for new string
  for each character in the string, concatenate a character * 2 to new string
  return new string
Idea bank
=end

def repeater(string)
  new_string = ""
  string.each_char { |char| new_string << (char * 2) }
  new_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''