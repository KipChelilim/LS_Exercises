=begin
PEDAC
  start 1242
  finish 12:57
  time 15min
Problem
  rules
    accept string input
    double each non-vowel alphabetic character
    return new string
  clarifying questions

Examples: covered by all examples
  vowel
  non-vowel
  punctuation
Data
  input: string
  intermediate:
    new string to capture results
    regex for alphabetic, then non-vowels
  output: string
Algorithm
  create placeholder for results
  for each character
    skip if its a nonalphabetic (regex alphabetic characters, test squeeze w/ selectors)
    otherwise, double it and add to placeholder
  return new string with vowels reduced
Idea Bank
=end

def double_consonants(string)
  new_string = ""
  string.each_char do |char|
    number_of_chars = char.match?(/[a-z]/i) ? 2 : 1
    new_string << (char * number_of_chars)
  end
  new_string.squeeze('aeiou')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""