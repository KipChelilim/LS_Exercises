=begin
PEDAC
  start: 8:07
  finish 8:31
  time 24min
Problem
  explicit rules
    take a string argument and swap the casing of each character
    do not use swapcase method
    return a new string
    do not change non-alphabetic characters
  implicit rules
    none
  clarifying questions
    how should empty strings be handled (assume non-empty)
Examples: covered below
  alphabetic
  non-alphabetic
Data
  input: non-empty string
  intermediate:
    each char array
    create new string
  output: new string w/ casing swapped
Algorithm
  create hashes for upper and lowercase mapping
  create new string
  look at each character (each char)
  replace it with the corresponding upper case version
    if non-alphabetic, next
    if current case upper? look up to upper hash : loop up to inner hash
  return new string
=end

UPPER_CASE_MAPPING = ('a'..'z').to_a.zip(('A'..'Z').to_a).to_h
LOWER_CASE_MAPPING = UPPER_CASE_MAPPING.invert

def swapcase(string)
  new_string = ''
  string.each_char do |char|
    if char =~ /[^a-zA-z]/
      new_string << char
    elsif char.upcase == char
      new_string << LOWER_CASE_MAPPING[char]
    else
      new_string << UPPER_CASE_MAPPING[char]
    end
  end
  new_string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'