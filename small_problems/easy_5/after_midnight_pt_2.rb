=begin
PEDAC start 5:50 finish 6:24  time 34min
Problem
  explicit rules:
    accept a string representing time in 24 format ("hh:mm")
    return number of minutes before or after midnight
    return should be in the range 0..1439
    can't use Date and Time methods

  implicit rules:
    method `before_midnight` should calculate neg minutes but return pos integer
      e.g. before_midnight(23:59) == -1 min, but return value is 1
    method `after_midnight` should calc positive min but return positive integer
      e.g. after_midnight(23:19) == 1439 min, return is 1439 min
    '00:00' is equivalent to '24:00' and should return 0

  clarifying questions:
    should we expect inputs like 00:60 instead of 01:00? (assume yes, as it doesnt matter)

Examples:
  `before_midnight`
    no change
      '00:00' => 0
      '24:00' => 0
    hours difference
      '01:00' => 60
      '00:60' => 60
    minutes difference
      '00:59' => 59
      '23:59' => -1min
    hours & minutes difference
      '01:59' => 119
      '01:60' => 200
  `after_midnight`
    no change
      '00:00' => 0
      '24:00' => 0
    hours difference
      '01:00' => 1380
      '00:60' => 1380
    minutes difference
      '23:59' => 1439
    hours & minutes difference
      '01:59' => 1319
      '01:60' => 1320

Data
  inputs: string, delimited with ":"; first string is base 24, second base 60
  intermediate:
    array for split string, but elements converted to integer, sum of integers after
    sum of integers after converting to base 10
  outputs: integer value

Algorithm
  create constants `MIN_PER_DAY` and `MIN_PER_HOUR`
  accept `time` input as string
    23:59
    00:00
  split time into `hours` and `minutes`
    ['23', '59']
    ['00', '00']
  convert `hours` and `minutes` to integers in `time_delta`
    [1380, 59].sum == 1439
    [0, 0].sum == 0
  for `before_midnight` subtract from total minutes in a day and return result (use % for all)
    zero edge case: -> % modulo away
    normal case: 1440-1439 == 1 -> modulo has no impact
  for `after_midnight` return `time_delta` (use % for all)
    edge case: 1440 -> % this away
    normal case: 1439 -> % has no impact
=end

MIN_PER_DAY = 1440
MIN_PER_HOUR = 60

def after_midnight(time)
  time_delta(time) % MIN_PER_DAY
end

def before_midnight(time)
  (MIN_PER_DAY - time_delta(time)) % MIN_PER_DAY
end

def time_delta(time)
  hours, minutes = time.split(":").map(&:to_i)
  hours *= MIN_PER_HOUR
  hours + minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0