=begin
PEDAC
  start 7:44
  finish 8:04
  time 20min
Problem
  explicit rules
    accept a single string argument containing words delimited by non-blank characters
    return a new string with the same value, but each word capitalized
  implicit rules
    if a symbol precedes a word, do not upcase the next character
    only if a space precedes the word
    downcase any uppercase letters within the word
  clarifying questions
    when you say original value of the arg => does it need to be the same object? (no)
    can there be multiple blank characters between words? (assume no)
    can there be an empty string? (yes)
    can there be a string with one word? (yes)
Examples
  word with leading symbol
  word with upcased letter in the middle
  multiple spaces
Data
  input: string of words delimited by potentially multiple spaces and of various casing
  intermediate:
    array of words
    indices of
  output: new string of same size but each word is captialized
Algorithm
  split array into individual words
  capitalize the word
  join array into new string
=end

def word_cap(string)
  string.split(' ').map(&:capitalize).join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'