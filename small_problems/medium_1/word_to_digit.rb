=begin
PEDAC
  start 157
  finish 2:15
  time 18min
Problem
  rules
    accept a string input containing words and string versions of numbers 1-9

    convert the numbers into their numeric format in the string
    return a new string
  clarifying questions
    should we assume only numbers one-nine will be used? yes
    should we assume consecutive string-numbers should be a single digit? assume yes
Example: see above
  (e.g "one zero minutes" == "1 0 minutes", not "10 minutes")
Data:
  create hash with word
Algorithm
  create hash with keys one-nine, and values 1-9
  separate periods from each word with a space delimiter
  turn string to an array and for each word
    return the hash look up if the word is included in hash keys
    otherwise return the word
  join result with spaces
  remove spaces before periods
=end

NUMBER_TO_STRING = %w(zero one two three four five six seven eight nine).zip('0'..'9').to_a.to_h

# def word_to_digit(string)
#   string = string.gsub(".", " .")
#   string.split.map do |word|
#     if NUMBER_TO_STRING[word].nil?
#       word
#     else
#       NUMBER_TO_STRING[word]
#     end
#   end.join(" ").gsub(" .", ".")
# end

# Refactored
def word_to_digit(string)
  result = string
  NUMBER_TO_STRING.each do |str_num, num|
    result.gsub!(str_num, num)
  end
  result
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'