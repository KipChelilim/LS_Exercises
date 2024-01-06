=begin
PEDAC
  start: 4:57
  finish: 5:40
  time: 43min

Problem
  explicit rules
    take a number representing an angle between 0 and 360 degrees
    return a string representing the degree, minutes and seconds of the angle
      degrees (°) - 60 min
      minutes (') - 60 seconds
      seconds (")
    result should be within a second or two of the examples provided
    use two digit numbers with leading zeroes for minutes and seconds
    degree symbol constant == "\xC2\xB0"
  implicit rules
    integer can be provided, but should be treated as float
    360 as an input can return 0 or 360 -> default to 360
  clarifying questions
    minutes and second rounded to the nearest whole number or truncated?
      appears to be truncated in example 4 -> follow this convention

Example
   76.73 => 76 degrees, .73 degrees
    .73 degrees => .73 * 3600 => 2628 seconds
      2628 seconds => 43 min, 48 seconds

Data:
  input: integer or float, numeric
  intermediate:
    array for degree, min, second
  output: string with specific formating rules enclosed with %()
    degree -> ° afterwards
    min -> 2chr leading zero with ' after
    second -> 2chr leading zero with " after

Algorithm:
  create constants for `minutes in degree`, `seconds in minutes` and `seconds in degree`
    60
    60
    60*60 = 3600
  take input and convert to float
    76.73
    30.0
  assign `degrees` to input as integer (will truncate)
    76
    30
  assign `minutes_and_seconds` to difference from input and truncated number * seconds in degree
    0.73 * 3600 => 2628
    0.00 * 3600 => 0
  assign `minutes` and `seconds` to `minutes_and_seconds` modulo seconds in minutes
    [43,48]
    [0,0]
  truncate both `minutes` & `seconds`
    [43,48]
    [0,0]
  output formatted string
=end

MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60
SECONDS_IN_DEGREE = SECONDS_IN_MINUTE * MINUTES_IN_DEGREE
DEGREE = "\xC2\xB0"

def dms(number)
  degrees = number.to_i
  minutes_and_seconds = (number.to_f - degrees) * SECONDS_IN_DEGREE
  minutes, seconds = minutes_and_seconds.divmod(SECONDS_IN_MINUTE).map(&:truncate)
  "#{degrees}#{DEGREE}#{'%02d' % minutes}'#{'%02d' % seconds}\""
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") || dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")