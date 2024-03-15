=begin
start 512, end 630, time 1hr 18min
Problem
convert decimal numbers into roman nummber equivalents -assume less than 3000
  1    - I
  5    - V
  10   - X
  50   - L
  100  - C
  500  - D
  1000 - M
need to_roman method public
accept integer at instantiation & store

Data
  lookup from number to roman numeral as string
  array for digits maintaining their place
Algorithm
conversion:
  break into digits representing decimal place (digits)
    eg 59 => [9, 5]
  swap numeric for roman numeral in each place, skipping zeroes
    do swap if 0..3
    do special swap if 4..8
    do special swap if 9
  return concatenated string
    eg 59 => LIX

lookup:
  ("1" + idx * "0") = > lookup unit * digit
    59 => [[0, 9], [10, 5]]
    59 => [[I, 9], [X, 5]
    59 => [[XI, 1],


  special case swap:
    ones
      if 1..3 = >
        look up ones, multiply by digit
      if 4, 9 =>
        get special
    tens
      if 1..3 = >
        look up ones, multiply by digit
      if 4, 9 =>
        get special
    hundreds
    thousands

  all cases
    (less than 3)     + (1 if less than 5) + (amount greater than 5, less 8)
    digit.clamp(0..3)   if digit.clamp(, 4)
=end

class RomanNumeral
  ARABIC_TO_ROMAN = [["I", "V"], ["X", "L"], ["C", "D"], ["M"]]

  def initialize(int)
    @arabic_numeral = int
  end

  def to_roman
    digits = arabic_numeral.digits
    digits.map.with_index do |digit, idx|
      case digit
      when (0..3) then ARABIC_TO_ROMAN[idx].first * digit
      when (4..8) then five_conversion(digit, idx)
      when 9      then nine_conversion(digit, idx)
      end
    end.reverse.join
  end

  private

  attr_reader :arabic_numeral

  def five_conversion(digit, dec_place)
    prefix_count = (5 - digit).clamp(0..1)
    suffix_count = (digit - 5).clamp(0..3)
    single_unit = ARABIC_TO_ROMAN[dec_place].first
    base_five = ARABIC_TO_ROMAN[dec_place].last
    (single_unit * prefix_count) + base_five + (single_unit * suffix_count)
  end

  def nine_conversion(digit, dec_place)
    ARABIC_TO_ROMAN[dec_place].first + ARABIC_TO_ROMAN[dec_place + 1].first
  end
end

p RomanNumeral.new(7).to_roman