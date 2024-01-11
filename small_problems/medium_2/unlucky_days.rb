=begin
PEDAC
  start 746
  finish 759
  time 13min
Problems
  rules
    accept a year as an integer argument
      assume the year is greater than 1752 (i.e. gregorian calendar in use)
    return the number of friday the 13ths in the year
  clarifying questions
    what day was it on 1/1/1752?
Examples
Data
  input: year
  intermediate:
    array/hash with months & number of days in each
  output: integer, number of days
Algorithm
  for every month in year check if the 13th is a friday
  if so increase counter
  check if its a friday and if so increase counter
  for every week after
    stop if year changes
    check if its a friday and if so increase counter
    confirm
=end

require 'date'

def friday_13th(year)
  result = 0
  1.upto(12) do |month|
    result += 1 if Date.new(year, month, 13).friday?
  end
  result
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2