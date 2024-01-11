=begin
PEDAC
  start 1051
  finish 11:32
  time 41 mins mostly debugging
Problem
  rules
    accept a string containing words and parentheses
    check if the parentheses are properly balanced
      each '(' has a matching ')' (i.e. counts of each are the same
      each pair starts with  '('

  clarifying questions

Examples:
  none = okay => counts
  odd number = not okay => counts
  starting with ( not okay => sequencing
  starting with ( okay => sequencing
Data
  input: string
  intermediate:
    array of parens only
  output: boolean
Algorithm
  extract all parens (new var, delete nonparen chars w/ regex /[^()]/)
  delete out matches of () until empty or no more matches (loop break unless you can find /()/)
  if extract is empty return true
  false
Idea bank
- if there is a proper match with nested parens then this must be true
  - count of all parens is even
  - must match this pattern (((((())))))
-so my delete would need to run n times where n = size/2
=end

def balanced?(string)
  parens = string.delete('^[()]')
  loop do
    break unless parens =~ /\(\)/
    parens['()'] = ""
  end

  return true if parens.empty?
  false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false