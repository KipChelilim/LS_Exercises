=begin
PEDAC
  start 923
  finish 1017
  time 54min
Problem
  rules
    read the content of a text file
    determine the longest sentence in the file based on number of words
    sentences can end with a period (.), exclamation point (!) or question mark (?)
    any non-blank sequence should be considered a word unless one of the above
    print the sentence and the number of words in it
  clarifying questions
Example
  provided example should give me the last sentence and 86 words
  gutenberg should get a sentence 157 chars long
Data
  input: txt file containing sentences as string
    -sentence: any sequence of characters ending in one of '!', '.', or ','
    -word: any sequence of non-blank characters (i.e. characters delimited by spaces in sentence)
  intermediate:
    arrays for each sentence
    sub array of each word
  output:
    sentence and then number of words
Algorithm
  read in the file

  split the text by delimiters
  split each sentence into words
  print sentence with largest word count
  print number of words
=end

print ">> Please enter the the text you'd like to analyze: "
file = gets.chomp
puts ">> Reading...\n\n"

text = File.read(file)
sentences = text.split(/[.?!]/).map { |sentence| sentence.split(" ") }
longest_sentence = sentences.sort { |first, second| second.size <=> first.size }.first

puts ">> The longest sentence is #{longest_sentence.size} words long:"
puts longest_sentence.join(" ")