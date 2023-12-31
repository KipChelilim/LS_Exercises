# PEDAC: start 3:41, finish 4:09 => 28 min
# Problem
  # explicit rules
    # identify the century based on the year input
    # return century as a string
    # end with st, nd, rd, or th based on result
    # start new centry with years ending in 01

  # implicit rules
    # accept year as integer
    # century is identified by digits up to hundreds place
      #  (i.e. year w/o last 2 digits)

  # questions:
    # should we consider negative numbers / BC? (assume no)
    # will input always be an integer? (assume yes)

  # inputs: integer value
  # outputs: string value of century with appropriate suffix

# Examples:
  # century(2000) == '20th'
  # century(2001) == '21st'
  # century(1965) == '20th'
  # century(256) == '3rd'
  # century(5) == '1st'
  # century(10103) == '102nd'
  # century(1052) == '11th'
  # century(1127) == '12th'
  # century(11201) == '113th'

# Data: integers and strings, string slices
# Algorithm
  # - accept a year as an integer
  # - get the digits up to hundreds place to find century (e.g. 101 => 1)
  # - if last two digits are greater than 0, increase century by 1 (e.g.  101 => 1 +1)
  # - check last digit of final century
  #   - when between 4 & 20, always th
  #   - else, if last is 1 - > st
      #       if last is 2 ....
  # - apply appropriate suffix based on last digit (e.g.  101 => 101st)
  # - return final value as string
# Code

def century(year)
  century_string = year.fdiv(100).ceil.to_s

  suffix = if century_string[-2,2].to_i.between?(4,20)
             "th"
           elsif century_string[-1] == "1"
             "st"
           elsif century_string[-1] == "2"
             "nd"
           elsif century_string[-1] == "3"
             "rd"
           else
             "th"
           end
  century_string + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201)  == '113th'