# PEDAC: start 4:11 finish 4:25
# Problem
  # explicit rules
    # accept any year greater than 0
    # return true or false if it is or is not a leap year
    # leap year is any year evenly divisible by 4 and not 100 or by 400
  # implicit rules
    # accept integer values
    # assume rule applies to years greater than 0

  # questions:
    # assume input will always be integer greater than 0? (assume yes, so no error messaging)

  # inputs: integer
  # outputs: boolean

# Examples: test case groups:
  # 1    => not divisible by 4 or 100
  # 100  => divisible by 4 and 100 exactly
  # 200 => divisible by 4 and 100 but not 400
  # 400  => divisible eby 4 and 100 and 400
  # misc => see below

# Data: integer, float, boolean
# Algorithm:
  # - accept integer input
  # - check if modulo 4 has a remainder and if modulo 100 has a remainder
  # - check if modulo 400 has a remainder
  # - return boolean based on result
# Code

def leap_year?(year)
  div_by_4_bool_result = year % 4 == 0
  div_by_100_bool_result = year % 100 == 0
  div_by_400_bool_result = year % 400 == 0

  if (div_by_4_bool_result && !div_by_100_bool_result) || div_by_400_bool_result
    true
  else
    false
  end
end

p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(200) == false
p leap_year?(400) == true
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false