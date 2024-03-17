=begin
PEDAC
  start 623
  finish 712
  time 51min
Problem
  rules
    accept text from a file
    add in a selection of randomized nouns, verbs, adjectives, and adverbs into text
    print the output
  clarifying questions
Example
Data
  hash with keys as category, arrays containing randoms
Algorithm
  read in the text
  for each line in the text
    count the number of replacements needed
    for each replacement
      look up the word to be replaced
      replace with a sample from hash
  return file object
=end

# replacements = {
#     adjective: %w(quick lazy sleepy ugly),
#     noun: %w(fox dog head leg),
#     verb: %w(jumps lifts bites licks),
#     adverb: %w(easily lazily noisily excitedly),
# }

# text = File.read("./text/madlibs.txt")
# madlib = text.split("\n").map! do |line|
#   line.split(" ").map! do |word|
#     if word =~ /%\{.*\}/
#       category = word.match(/%\{(.*)\}/)[1].to_sym
#       word.gsub!(/%\{.*\}/, replacements[category].sample)
#     else
#       word
#     end
#   end.join(" ")
# end.join("\n")

# puts madlib

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('text/madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end