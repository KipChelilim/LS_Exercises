=begin
PEDAC
  start 1024
  finish 1052
  time 18min
Problem
  rules
    accept a word as a string
    check if it can be spelled form a set of blocks and return true if it can
      a block is: a pair of letters
      a word cannot use both letters from a block
      the word is valid if it can be spelled by the collection of blocks
    blocks
      B:O   X:K   D:Q   C:P   N:A
      G:T   R:E   F:S   J:W   H:U
      V:I   L:Y   Z:M
    case doesn't matter
    return
  clarifying questions

Examples
  batch => true
  butch => false because of U and H
  jest => true

Data
  input: string word
  intermediate:
    hash for each block - constant
      sub-array as values containing letters
    separate hash indicating if the letter is valid or not?
  output: boolean

Algorithm
  downcase the input
  check what block the letter belongs to
    return false if letters arent in hash
    add block to array of found blocks
  if a block is represented twice, return false
=end

letters = %w(b o x k d q c p n a g t r e f s j w h u v i l y z m)
BLOCKS = {}
until letters.empty?
  first, second = letters.slice!(0..1)
  BLOCKS[first.to_sym] = "#{first}:#{second}"
  BLOCKS[second.to_sym] = "#{first}:#{second}"
end

def block_word?(word)
  used_blocks = []
  word.downcase.each_char do |char|
    used_blocks << BLOCKS[char.to_sym]
  end
  return false if (used_blocks.uniq != used_blocks || used_blocks.include?(nil))
  true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true