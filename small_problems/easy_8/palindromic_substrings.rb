=begin
PEDAC
  start 827
  finish 8:48
  time 21min
Problem
  explicit rules
    take a string argument
    identify all substrings that are palindromic (i.e. read same forward and back)
    duplicates should be listed multiple times
    can use the substrings method from the previous exercise
    consider all characters
    apply case sensitive logic
    ignore single character substrings
  implicit rules
    return an array either empty or with found palindromes
  clarifying questions
    when we say "all characters" does that mean spaces, nonalphabetic, etc, such that
      'a b a' is a palindrome, but 'ab a' is not?
      appears so based on treatment of hyphen in ex 3, assume yes
Examples
  empty string => empty array
  string size 1 => empty array
  string greater than 1 character:
    single character substrings = > not in result
    no palindomes => empty array (first example)
    1 or more palindromes => array size 1 or many (remaining 2 examples)
      letters only => 2nd example
      special characters => 3rd example
      duplicates => 4th example
      case sensitive => 5th example
Data
  input: string 0 or more alphanumeric and special characters
  intermediate:
    array of substrings
    array of found palindromes? double check after algorithm, may not need
Algorithm
  create an array of substrings (substrings method)
  remove all substrings that are less than 2 characters (select > 1
  select all substrings that are equivalent when read fowards and backwards (string.reverse - test)
  return resulting array of found items
Idea bank
=end

def substrings(string)
  results = []
  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      results << string[start_idx..end_idx]
    end
  end
  results
end

def palindromes(string)
  substrings(string).select do |substring|
    (substring.size > 1) && (substring.reverse == substring)
  end
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('Abcba') == ["bcb"]
p palindromes('') == []