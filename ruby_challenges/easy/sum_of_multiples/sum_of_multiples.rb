=begin
Time
  start 950
  pause 3min
  finish 1030
  time 37 min -> too much time method hunting & troubleshooting #union
  refactor
Problem
  accept a natural number `limit`
  and a set of none or more other numbers `set`
  find the sum of multiples from `set` using only multiples less than `limit`
  if a set is not provided, use 3 & 5 as default
  test cases:
    create a class `SumOfMultiples`
      accept the `set` as separate arguments
    create a method `to` that calculates the sum of multiples
      create as an instance method and a class method
      accept the argument `limit`
    do not duplicate multiples

Example
Data:
  input:
    instantiation -> one or more integers as `set`
    to method invocation -> one integer as `limit`
  intermediate:
    array of uniq multiples
    enumerable for step sequence
  output
    sum of multiples as integer
Algorithm
  instantiate a `SumOfMultiples` object
    accept optional arguments as a set
  calculate list of multiples
    check if set was populated, if not use [3, 5]
    iniitialize `multiples` list
    for each integer in the set
      create sequence that steps from integer to `limit` less one
        push each number in sequence into multiples
    remove duplicates
    calculate the sum of resulting integers
=end

class SumOfMultiples
  def initialize(*integers)
    @set_of_numbers = integers
  end

  def to(limit)
    set = set_of_numbers.empty? ? [3,5] : set_of_numbers
    set.each_with_object([]) do |num, multiples|
      multiples.concat(num.step(by: num, to: limit - 1).to_a)
    end.uniq.sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

  private

  attr_reader :set_of_numbers
end