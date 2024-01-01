=begin
PEDAC start 7:24 finish 7:45 time 21min
Problem
  explicit rules
    accept a string of all lower cased words, and non-alphabetic characters
    return the string and replace the non-alphabetic characters with spaces
      one space per sequence of non-alpha (e.g. %%%, %, and %#$ both equal 1 space)
      no consecutive spaces

  implicit rules:
    replace even non-alphas that make sense (e.g. what's should be what s)]
    if the string comes in with duplicate spaces, remove those as well

  clarifying questions:
    assume ('a'..'z') are the only characters that should not be cleaned up? (yes)
    return just a space if there are only non-alphas? (assume yes)

Examples
  single character: hello%world => hello world
  consecutive characters => hello@#world => hello world
  none => helloworld => helloworld
  only? => @#$# => ' '

Data
  input: string with alphas in lowercase ('a'..'z') and other chars
  intermediate:
    regex object for non-alpha strings
    or an array split by non-alphas
  output: string with only single spaces and alpha chars

Algorithm
  accept `sentence`
  search `sentence for non-alphabetical characters (regex)
    include spaces here to handle consecutive spaces in the input (/^[a-z]/ -> test it)
  replace those characters with a space (test gsub to confirm arg signature with regex)
  squeeze resulting string for spaces specifically
  return modified sentence
=end

def cleanup(sentence)
  sentence.gsub(/[^a-z]/, " ").squeeze(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("hello%world") == "hello world"
p cleanup("hello@#world") == "hello world"
p cleanup("helloworld") == "helloworld"
p cleanup("@#$#") == ' '