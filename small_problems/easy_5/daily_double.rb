=begin
PEDAC
  start: 2:13
  finish: 2:31
  time: 18min

Problem
  explicit rules:
    accept a string argument
    remove duplicate contiguous characters (do not mutate)
    return a new string
    do not use squeeze methods
  implicit rules
    empty string should return empty string
  clarifying questions
    input will always be downcased? (assume no)

Examples:
  'ddaaiillyy'

Data
  input: string with contiguous duplicate chars
  intermediate: array of chars
  output: new string

Algorithm
  accept string as `string`
    'ddaaiillyy'
  set new_string == first char of `string`
    'ddaaiillyy' => 'd'
  for each character in string
    check if `character` == last character in new string
    if it is, next
    if it isn't, append `character` to new string
  return new string

  example walkthrough: 'ddaaiillyy', new_string 'd'; iterations:
    1 iteration
      'd' == 'd' true, so next
    2nd iteration
      'd' == 'd' true, so next
    3rd iteration
      'a' == 'd' false, so new_string == 'da'
    .....
=end

def crunch(string)
  return string if string.empty?
  new_string = string[0]
  string.each_char do |character|
    next if character == new_string[-1]
    new_string << character
  end
  new_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''