=begin
start: 9:39 finish: 10:07 time: 28 min due to overanalyzing / optimizing

Problem:
  take a word and calculate it's scrabble score
  tile scores:
     1: [A, E, I, O, U, L, N, R, S, T]
     2: [D, G]
     3: [B, C, M, P]
     4: [F, H, V, W, Y]
     5: [K]
     8: [J, X]
    10: [Q, Z]
  scoring rules:
    sum value of all tiles used in word
    1 point for each occurence
    create a Scrabble class
      accepts any character at initiation
      instance method `score`
        if its not a letter, return zero as score
      valid word test should so far only test for alphabetic characters


Examples:
  backslashes and spaces in word -> zero score
  nil -> zero score
  single letter, not a word -> score for that tile
  empty string -> 0
    zero points for an empty word
  random sequence of valid characters -> score for those letters

Algorithm
  score:
    create a hash containing each letter's score
    test if word contains only valid characters
      if not, return zero
    get score and sum
=end

class Scrabble
  def initialize(string)
    @word = string
  end

  def self.score(word)
    return 0 unless word.is_a? String
    test_word = word.upcase
    return 0 if (test_word =~ /[^A-Z]/)
    test_word.chars.map { |letter| TILE_SCORE[letter.to_sym] }.sum
  end

  def score
    self.class.score(@word)
  end

  private

  TILE_SCORE = {
    A: 1,
    B: 3,
    C: 3,
    D: 2,
    E: 1,
    F: 4,
    G: 2,
    H: 4,
    I: 1,
    J: 8,
    K: 5,
    L: 1,
    M: 3,
    N: 1,
    O: 1,
    P: 3,
    Q: 10,
    R: 1,
    S: 1,
    T: 1,
    U: 1,
    V: 4,
    W: 4,
    X: 8,
    Y: 4,
    Z: 10
  }
end