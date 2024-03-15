=begin
Time
  start 923
  finish 951
  time 28 min -> mixed up string vs array methods, too much optimization
  refactor
Problem
  accept a string of digits `digits`
  accept an integer representing a `series_length`
  return an n-digit series from the provided string
  series should be a substring of original digit string, not comb/perm
  if you ask for larger length than object, throw error

  test cases:
    class `Series`
      accept string of digits at instantiation
    instance method `slices` that accepts integer as `series_length`
      returns array of subarrays
      subarrays contain digits of series as integers, each its own element
    raise Argument error if slices length is too large
Examples
  01234
  slices(3) => [[0,1,2], [1,2,3], [2,3,4]]
  slices(4) => [[0,1,2,3], [1,2,3,4]]
Data
Algorithm
  instantiate `Series` object
    store `digits` as string
    initialize `@series_array` with attr methods (private)
  slices method, accept series_length
    raise argument error if series_lenght is greater than `digits` length
    from first idx to nth last idx, where n == `series_length`
      get a slice of n length
      split the slice into characters
      convert each string to an integer
      store resulting array in result
    return result
=end

class Series
  def initialize(digits)
    @digits = digits
    @series_array = []
  end

  def slices(series_length)
    raise ArgumentError if series_length > digits.length

    last_idx = digits.length - series_length
    (0..last_idx).each do |idx|
      series_array << digits.chars[idx, series_length].map(&:to_i)
    end

    series_array
  end

  private

  attr_reader :digits, :series_array
end