=begin
PEDAC
  start: 8:35
  finish 8:47
  time 12min
Problem
  explicit rules
    accept a single string argument
    transform string to alternate casing throughout string
    non-alphabetic characters should be unchanged but count in the pattern
      e.g 'a b' should be 'A B'
    return a new string with changes
  implicit rules
    start with capital letter every time regardless of input
  clarifying questions
    return an empty string if empty string is provided? (yes)
Examples
  empty string
  multiple characters (covered by provided examples
Data
  input: single string
  intermediate:
    placeholder for new string
  output: new string
Algorithm
  set flag for whether to upcase or downcase the character
  downcase entire string
  for each character
    if flag is true
      upcase && set to opposite
    if flag is false
      just char and set to opposite
=end

def staggered_case(string)
  upcase_the_char = true
  new_string = ""
  string.downcase.each_char do |char|
    new_string << (upcase_the_char ? char.upcase : char)
    upcase_the_char = !upcase_the_char
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'