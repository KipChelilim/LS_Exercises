=begin
PEDAC
  start 245
  finish 247
  time 2 min
Problem
  rules
    accept a string argument of words delimited by one space
    return an array with each word from the argument
    append a space and the character size of the word to each element
    return the resulting array
    empty strings should return an empty array
=end

def word_lengths(string)
  string.split.map do |word|
    "#{word} #{word.size}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []