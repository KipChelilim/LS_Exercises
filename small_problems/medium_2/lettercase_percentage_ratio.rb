=begin
PEDAC
  start 940
  finish 1004
  time 24min
Problem
  rules
    accept a non-empty string value containing alpha, numeric, and special characters
    create hash with keys lowercase, uppercase, and neither (as symbols)
    for each key, set the value equal to the percentage of characters in each category
    percentage should be in % format without the % symbol, and with one decimal place
    every key should be in the hash, whether its frequency 0 or more
  clarifying questions
    assume the percentage should be rounded to the 3rd decimal place vs truncated? assume yes
Example: see examples below
Data
  input: string
  output: hash
Algorithm
  set hash equal to keys at 0
  for each character in string
    check if it matches non-alphabtic character => increase neither count
    check if it matches upper case => increase (upper count / size)
                        lower      => increase lower count
  for each hash entry, divide counts by size of string
=end

def letter_percentages(string)
  result = {lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  string_length = string.size.to_f
  string.each_char do |char|
    case char
    when /[^a-z]/i      then result[:neither] += 1
    when /[[:upper:]]/  then result[:uppercase] += 1
    when /[[:lower:]]/  then result[:lowercase] += 1
    end
  end
  result.each do |key, value|
    result[key] = ((value / string_length) * 100).round(1)
  end
end

def letter_percentages(string)
  result = {lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
  string_length = string.size.to_f

  result[:lowercase] += (string.count('[a-z]') / string_length * 100).round(1)
  result[:uppercase] += (string.count('[A-Z]') / string_length * 100).round(1)
  result[:neither] -= (result[:lowercase] + result[:uppercase])
  result
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}