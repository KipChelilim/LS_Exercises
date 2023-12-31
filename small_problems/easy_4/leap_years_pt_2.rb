# PEDAC: start 4:41 finish 4:58 (sidetracked)
# Problem
  # explicit rules
    # same as prior problem
    # from 0 - 1752, only apply divisible by 4 rule, ignore 100 exception
    # after 100, use prior rules
  # implicit rules:
    # no additional inputs, method should determine based on just the year

# Examples:
  # 100 => should be true
  # 200 => should be true
  # 1752 => should be true
  # 1800 => should be false
  # misc see below

# Algorithm
  # accept an integer
  # check if it is less than 1753
  # if so, apply divisible by 4 rule
  # if not, apply divisible by 4, 100, and 400 rules
  # return boolean result

# Code

def leap_year?(year)
  div_by_4_bool_result = year % 4 == 0
  div_by_100_bool_result = year % 100 == 0
  div_by_400_bool_result = year % 400 == 0

  if (year < 1753) && div_by_4_bool_result
    true
  elsif (div_by_4_bool_result && !div_by_100_bool_result) || div_by_400_bool_result
    true
  else
    false
  end
end

p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(200) == true
p leap_year?(400) == true
p leap_year?(1752) == true
p leap_year?(1800) == false
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1700) == true