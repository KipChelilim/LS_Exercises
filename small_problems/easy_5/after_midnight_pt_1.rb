=begin
PEDAC start 2:50 pause 253 start 303 finish 4:21 total: 1hr 20min wow
Problem
  explicit rules:
    Accept an integer value `minutes` and calculate the time of day
    Time of day is `minutes` before or after midnight (before being negative)
    Return value should be a string representing the time in 24 hour format (hh:mm)
    accept any integer input including zero
    do not use Date or Time classes
    ignore daylight savings and standard time, or other complications

  implicit rules:
    return a string value
    input should be integer zero positive or negative
    not worried about days or am pm

  clarifying questions

Examples
  0 is equivalent to 24:00, 1440 == full 24 hours
    3 => 24 - 3 == 23:57
    0 => no change
    +60 => 1:00
    -60 => 23:00
    -1441 = no change
    -2881 = no change

Data:
  inputs: integer value, pos neg, zero
  intermediate: two variables for hours and minutes
  output: string value in "hh:mm" format

Algorithm: How many hours do i need to subtract from 24, how many min do i need to subtract from 60
  constant variable `MINUTES_IN_A_DAY`
  get sign as +1 or -1
  convert abs value of input into partial days' minutes (% with sign)
    1441 => 1
    -1501 => -61
  if negative subtract amount from full day
      -1501 => MINUTES_IN_A_DAY-61 == 1379
  convert to format (divmod, then interpolate w/ formatting)
    convert input into hours, minutes
    hours divided by 60 -> truncated == hours, remainder == min
      1441 => 0 hrs, 1 min
      -1501 => -0 hrs, -1 min
=end

MIN_PER_DAY = 1440
MIN_PER_HOUR = 60


# def time_of_day(change_in_time)
#   sign = change_in_time.negative? ? -1 : 1

#   partial_day = change_in_time % (MIN_PER_DAY * sign)
#   partial_day += MIN_PER_DAY if sign.negative?

#   hours, minutes = partial_day.divmod(MIN_PER_HOUR)

#   "#{'%.2d' % hours}:#{'%.2d' % minutes}"
# end

# Refactored after looking through solution
def time_of_day(change_in_time)
  change_in_time += MIN_PER_DAY
  partial_day = change_in_time % (MIN_PER_DAY)

  hours, minutes = partial_day.divmod(MIN_PER_HOUR)

  "#{'%.2d' % hours}:#{'%.2d' % minutes}"
end

time_of_day(1441)
time_of_day(-1501)

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"