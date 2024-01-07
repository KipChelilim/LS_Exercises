=begin
PEDAC
  start 110
  finish 123
  time 13 min
Problem
  rules
    take a string argument of one or more words
      containing only letters and spaces
    reverse characters in words that are 5 or more characters
    return new string as a sentence
      if a single word is returned, no spaces in output
  clarifying questions
    none
Examples
  single word
    5 letters; testing reverse method
    less than 5; testing logic of when to reverse
Data
  input: string of one or more words delimited whitespaces
  intermediate:
    array of words
  output: sentence of transformed words as a string object return value
Algorithm
  split string into words
  test if the word is greater than 5 characters
  if yes, reverse
  if not, move on
  rejoin words into string
=end

def reverse_words(string)
  words = string.split
  words.map! do |word|
    word.size >= 5 ? word.reverse : word
  end
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS