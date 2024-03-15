=begin
start 818, finish 823, time 5  min
start 843, finish 920, time 37 min -> 42 min
refactor finish 935         15 min -> 57 min

Problem
  accept a word and list of possible anagrams
  select the correct sublist containing the anagrams of the word
  word criteria:
    single word, upper or lower case characters
  anagram criteria:
    case insensitive
    contains all letters exact same number of times
    is not the same word
  classes:
    Anagram class
      at initialization, accepts the `word`
      `match` method that accepts list of words as an array
        returns an array with matching words or empty

Examples
  example 1:
    word: listen
    potential anagrams: enlists, google, inlets, banana
    return: inlets

Data
  input:
    -Anagram object
      -`@word` as starting word
    -Array of words to check for anagrams
  intermedaite:
    - `@character_count` with freq table for characters?
      -separate method to make at initialization
  output: array from `match` containing list of words

Algorithm
  initialize a new `Anagram` with a string passed in as an argument
  store the word and create freq table of letters
  accept list of words
  check each word to see if its an anagram
    `anagram?`: check if each character's count is same as count from freq table of Anagram
  store anagrams in a new list and return them
    if `anagram?` store in list
=end

class Anagram
  def initialize(word)
    @word = word
    @letter_counts = frequency_table(word.downcase)
  end

  def match(candidates)
    candidates.select do |candidate|
      candidate = candidate.downcase
      (candidate != word.downcase) && anagram?(candidate)
    end
  end

  private

  attr_reader :word, :letter_counts

  def frequency_table(starting_word)
    starting_word.chars.uniq.each_with_object({}) do |chr, table|
      table[chr] = starting_word.count(chr)
    end
  end

  def anagram?(other_word)
    letter_counts.each do |chr, count|
      return false unless other_word.count(chr) == count
    end

    letter_counts.keys.sort == other_word.chars.uniq.sort
  end
end