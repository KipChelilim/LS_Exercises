=begin
PEDAC start 2:18 finish 2:40 22min
Problem
  -explicit rules:
    accept a string argument and return the sum of each character's ASCII value
    I can use the String#Ord method to get ascii value of each character

  -implicit rules
    -an empty string should return zero

  -clarifying questions
    - are there possible characters which will not have proper return to ord method (assume no)
    - any unique encoding we need to be able to handle? (assume no)
    - non string inputs - error messges? (assume no)

Examples
  -"    " (four spaces) => each space is 32, 32*4 == 128
  -"a" => character is position 97
  - "" => 0, but cannot call ord, need an edge case solution here

Data
  input: string object
  intermediate: array for each character to iterate
  output: integer output

Algorithm
  - test for an empty string and return zero if true
  - split string into characters
  - for each character, identify the ascii value (String#ord)
  - sum each ascii value and return it (combine with prior step)
=end

def ascii_value(string)
  return 0 if string.empty?
  string.chars.map(&:ord).sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
p ascii_value('    ') == 128