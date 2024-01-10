=begin
PEDAC
  start 710
  finish 7:42
  time 32min
Problem
  rules
    accept an integer argument representing number of switches `n`
    toggle the switches on and off according to the following pattern
      switches start in the off position
      perform `n` iterations toggling switches
      on the 1st iteration 1, start at 1 and toggle every 1 switch
      on the 2nd iteration, start at 2 and toggle every 2nd switch
      on the 3rd iteration, start at 3 and toggle every 3rd switch
      etc
    return the number of every switch that is "on"
      switches are numbered 1 through n
  clarifying questions
    since 'n` represents a number of switches, assume input is always positive integer > 0?
      assume yes
Examples
  n = 5
                1 2 3 4 5 6 7 8 9 0
    Round 1 => [1 1 1 1 1 1 1 1 1 1]
    Round 2 => [1 0 1 0 1 0 1 0 1 0]
    Round 3 => [1 0 0 0 1 1 1 0 0 0]
    Round 4 => [1 0 0 1 1 1 1 1 0 0]
    Round 5 => [1 0 0 1 0 1 1 1 0 1]
    Round 6 => [1 0 0 1 0 0 1 1 0 1]
    Round 7 => [1 0 0 1 0 0 0 1 0 1]
    Round 8 => [1 0 0 1 0 0 0 0 0 1]
    Round 9 => [1 0 0 1 0 0 0 0 1 1]
    Round 10=> [1 0 0 1 0 0 0 0 1 0]
Data
  input: positive integer
  intermediate:
    booleans to represent on or off => true is on, false is off
    hash with integers as keys?
  output: array of (index + 1) for true values
Algorithm
  take argument `n` and create switches
    for each number 1-n, create a hash with number as key
    set switches to "off" position
      set keys equal to false
  for each number of switches (1 up to n)
    and for every multiple based on n (where `multiple` represents all multiples of curr switch num)
      get list of switches to toggle based on multiple (take current num up to the limit by num)
      for each of those, toggle that switch to off
  identify which switches are on and put them in an array
    select from hash where value == true
    select the keys for those values and put them in an array
  return the array
=end

def light_switch(switch_count)
  switches = {}
  1.upto(switch_count) { |num| switches[num] = false }

  1.upto(switch_count) do |switch|
    switch.step(to: switch_count, by: switch).each do |multiple|
      switches[multiple] = !switches[multiple]
    end
  end
  switches.select { |_, status| status }.keys
end

p light_switch(5) == [1, 4]
p light_switch(10) == [1, 4, 9]
p light_switch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256,
                         289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]