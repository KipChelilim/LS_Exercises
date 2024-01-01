=begin
PEDAC start 1:05 1:37 time 32min
Problem
  explicit rules
    accept a string with one or more words, delimited by a space
    create a hash that counts number of words of different sizes
    words include any string character that is not separated by a space

  implicit rules
    keys are number of letters, values are the counts, both integer type
      eg: if there are 4 words with 5 letters, hash should say 5 => 4
    empty string should return an empty hash
    special characters count as a letter
      eg: What's => 6 characters
          fiddle! and fiddle, => both 7 characters
    hash entry order is unimportant

  clarifying questions
    include a non-alphabetic character on its own like hyphen? (assume yes)
    any white space? what about newlines or other non-printing characters? (assume none)

Examples
  empty string => ""
  single word (no spaces) => "hello"
  multiple words => "hello world"
  word with contiguous special character
  string with only spaces

Data
  input: string with `words` delimited by spaces
  intermediate:

  output:
    hash: `word` sizes as integer key, count of word sizes as integer value

Algorithm
  accept string as `sentence`
  create empty hash
  if sentence is empty return an empty hash
    "" => stops here
  split string into array `words`
    "hello" => ["hello"]
    "hello world" = > ["hello", "world"]
  replace array elements with count of `word` as `word_sizes` (map)
    "hello" => [5]
    "hello world" = > [5, 5]
  for each unique `word_size` from `word_sizes` (uniq, then each chained)
    set hash equal to hash[words_size] = words_sizes.count(words_size)
      "hello" => hash[5] = word_sizes.count(5) => hash[5] == 1
      "hello world" = > [5, 5] => [5] => hash[5] = word_sizes.count(5) => hash[5] == 2
  return hash
=end

def word_sizes(sentence)
  word_sizes_hsh = {}
  return word_sizes_hsh if sentence.empty?
  word_sizes = sentence.split.map do |word|
    word.size
  end

  word_sizes.uniq.each do |word_size|
    word_sizes_hsh[word_size] = word_sizes.count(word_size)
  end
  word_sizes_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
p word_sizes("hello") == { 5 => 1}
p word_sizes("  ") == {}