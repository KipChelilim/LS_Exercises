=begin
PEDAC start 6:52 7:19 time 27min
Problem
  explicit rules
    accept a string of words separated by spaces
    for each word, swap the position of the first and last letters
    return a string with the swapped words
    assume every word contains at least one letter
    assume the string has at least one word
    assume string has nothing but words and spaces

  implicit rules
    single words/characters should still give a return
    do not modify casing
    space is not considered a swappable character

  clarifying questions
    return a new string? (assume yes)

Examples
  'Oh what a wonderful' => 'hO thaw a londerfuw'
  'Abcde' => 'ebcdA'

Data
  input: string
  intermediate:
    array of words
    assign first and last elements to variables to avoid logic for 2 char words
  output: concatenated string by spaces

Algorithm
  accept `sentence`
    'Oh what a wonderful'
  split `sentence` by spaces into individual words as `sentence_arr`
    ['Oh', 'what', 'a', 'wonderful']
  for each `word` (map)
    return word if word.size == 1
    return word[-1] + word[0]
    return word[-1] + word [1..-2] + word[0]
  concatenate the `sentence_arr` with a space
  return result
=end

def swap(sentence)
  sentence_arr = sentence.split.map do |word|
    case word.size
    when 1
      word
    when 2
      word[-1] + word[0]
    else
      word[-1] + word [1..-2] + word[0]
    end
  end
  sentence_arr.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'