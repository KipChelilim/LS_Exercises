=begin
PEDAC
  start 320
  finish 351
  time 31min
Problem
  rules
    accept an array of words
    group words if they are anagrams of each other
      words only have letters from anagram group
    print out each group on separate lines, formatted like the below
      ["demo, "dome", "mode"]
      ["neon", "none"]
      etc
    should not have duplicate groups, i.e.
      ["demo, "dome"]
      ["mode"]
      etc
Algorithm
  transform array so characters of words are all sorted in order
  create list of unique anagram groups using sorted words and remove duplicates
  transform unique anagram group by selecting from original list
    select words that when transformed into sorted word, it equals the anagram group
  for each resulting array, print output
=end

def anagrams(words)
  anagram_groups = words.map { |word| word.chars.sort.join }.uniq
  anagram_groups.map! do |group|
    words.select do |word|
      word.chars.sort.join == group
    end
  end

  anagram_groups.each { |group| print "#{group}\n" }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams(words)