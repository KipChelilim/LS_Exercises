=begin
PEDAC
  start 7:17
  finish 7:37
  time 20min
Problem
  explicit rules
    accept a string with upper- & lower-case alphabetic characters
      and nonalphabetic characters
    calculate the number of characters that are upper, lower, or neither (i.e. non-alphas)
    return a hash with the counts of each group as values for those keys
  implicit rules
    keys should be symbols,
    values are counts of those groups as integers
    spaces, numerics, symbols count as neither
    empty string should still return 0 for all
  clarifying questions
    order of hashes in example doesn't matter? (assume yes)
Examples
  all three: ['Aa.']
Data
  input: string
  intermediate:
    array of characters
    hash to capture keys & counts from array of characters
  output: hash with symbol keys and integer values
Algorithm
  split string into individual characters
    ['Aa.'] => ['A', 'a', '.']
  replace each character with its group (e.g. a == :lowercase, A == :uppercase, + == :neither)
    [:uppercase, :lowercase, :neither]
  create an empty hash
    {}
  assign keys :lowercase, :uppercase, and :neither to the count of that symbol from array (tally)
    { :lowercase => 1, :uppercase => 1, :neither => 1 }
  return hash
=end

def letter_case_count(string)
  frequency = { neither: 0, uppercase: 0, lowercase: 0 }
  casing = string.chars.map do |char|
    if    char.match?(/[^a-zA-z]/) then :neither
    elsif char.upcase == char      then :uppercase
    elsif char.downcase == char    then :lowercase
    end
  end

  frequency.merge(casing.tally)
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }