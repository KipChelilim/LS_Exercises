=begin
PEDAC start 1:39 finish 1:48 time 9 min
Problem
  explicit rules
    same as before but modify the method to exclude special characters
      eg: "it's" should be 3 not 4

Algorithm
  accept string as `sentence`
  create empty hash
  if sentence is empty return an empty hash
    "" => stops here
  split string into array `words`
    "hello" => ["hello"]
    "hello world" = > ["hello", "world"]
  replace array elements with count of `word` as `word_sizes` (map)
    change count to count alphanumeric and downcase word to simplify range (gsub)
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
    word.gsub(/[^a-z^A-z]/,"").size
  end

  word_sizes.uniq.each do |word_size|
    word_sizes_hsh[word_size] = word_sizes.count(word_size)
  end
  word_sizes_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}