=begin
Time
  start 907
  finish 958
  time 51 minutes
  refactor
Problem
  create a clock without a date
  do not use built in date or time functionality
  add mintues and subtract mintues from time on the `Clock`
    do not mutate `Clock` objects, create new ones
  Two clock objects at same time should be equal

Examples
  test cases:
    class `Clock`
    class method `at` accepting two arguments
        integer `hour`
        integer `minutes` optional
      instantiates a new clock object

    instance method `to_s` returns string representation of time in military time
    instance method `+` allows adding minutes
        accepts single integer `minutes`
      returns clock object at new time
    instance method `-` similar to `+`

    addition and subtraction of time can "turnover" to a new hour/day
      do not implement the days, just turn over from 223:59 to 00:00
Data
Algorithm
  instantiation
    `at` class method
      calls new with two arguments, 2nd defaults to 0
      assign `@hours`
      assign `@minutes`
  rendering
    `to_s`
      return `@hours` and `@minutes`
  addition/subtraction
    turn clock into minutes
    add or subtract minutes
    convert back to hours & min based on mintues
    create new clock with new hours and minutes

  comparing
    check hours and minutes of both

  to hours and minutes

=end

module Timeable
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def to_hours_and_minutes(minutes)
    time = minutes.divmod(MINUTES_IN_HOUR)
    time[0] = time.first % HOURS_IN_DAY
    time
  end
end

class Clock
  include Comparable
  include Timeable

  def initialize(hour, minute)
    @curr_hour = hour
    @curr_minute = minute
  end

  def self.at(hour, minute=0)
    raise ArgumentError unless hour.between?(0,23) && minute.between?(0,59)
    new(hour, minute)
  end

  def +(minutes)
    new_time = to_hours_and_minutes(total_minutes + minutes)
    Clock.at(*new_time)
  end

  def -(minutes)
    new_time = to_hours_and_minutes(total_minutes - minutes)
    Clock.at(*new_time)
  end

  def <=>(other_clock)
    total_minutes <=> other_clock.total_minutes
  end

  def to_s
    "#{sprintf("%.2d:%.2d", curr_hour, curr_minute)}"
  end

  protected

  attr_reader :curr_hour, :curr_minute

  def total_minutes
    (curr_hour * 60) + curr_minute
  end
end