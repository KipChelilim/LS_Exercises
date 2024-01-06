=begin
PEDAC
  start: 551
  finish: 604
  time: 13min

Problem
  explicit rules
    accept an array of strings
    remove vowels and return resulting array
    array should contain the same string values so mutate
  implicit rules
    return empty string in place of element if all vowels
  clarifying questions
    assume mutate
Examples:
  ['aeiou', 'bcldk' 'yellow'] => ['', 'bcldk' 'yllw']

Data:
  input: array of strings
  intermediate:

  output: array of same strings

Algorithm
  take array
  for each element
    delete the vowels in the string
  return array
=end

# Mutating version
def remove_vowels(array)
  array.each do |word|
    word.delete!('aeiouAEIOU')
  end
end

# Non-mutating version
# def remove_vowels(array)
#   array.map do |word|
#     word.gsub(/[aeiouAEIOU]/,"")
#   end
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']