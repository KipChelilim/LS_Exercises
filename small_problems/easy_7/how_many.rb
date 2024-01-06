=begin
PEDAC
  start 604
  finish 6:15
  time 11min
Problem
  explicit rules
    accept an array as an input
    count the number of occurence in each array
    treat words as case sensitive
    print each element alongside the number of occurences
  implicit rules
    output should resemble key pair formatting: "element => frequency"
    print each element on separate lines
  clarifying questions
    assume non-empty array? yes
    elements can be any type? yes
      should nested arrays be considered one element? yes
    order from examples appears to be first occurence? yes, assume order not important
Example
  same word different casing: [SUV, suv, truck, SUV]
  single occurence covered above
  multiple occurences covered above
Data
  input: single array
  intermediate: hash of frequency
  output: print each key-value pair from hash
Algorithm
  tally frequency of elements in array and create hash
  for each key value pair in resulting hash, print key => value
Idea bank
=end

def count_occurrences(list)
  list.tally.each { |key, value| puts "#{key} => #{value}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
