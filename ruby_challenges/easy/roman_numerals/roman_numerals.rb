# Refactored after seeing another student's solution
class RomanNumeral
  ARABIC_TO_ROMAN = {
    1 => ["I", "X", "C", "M"],
    2 => ["II", "XX", "CC", "MM"],
    3 => ["III", "XXX", "CCC", "MMM"],
    4 => ["IV", "XL", "CD"],
    5 => ["V", "L", "D"],
    6 => ["VI", "LX", "DC"],
    7 => ["VII", "LXX", "DCC"],
    8 => ["VIII", "LXXX", "DCCC"],
    9 => ["IX", "XC", "CM"],
    0 => ""
  }

  def initialize(int)
    @arabic_numeral = int
  end

  def to_roman
    arabic_numeral.digits.map.with_index do |digit, dec_place|
      ARABIC_TO_ROMAN[digit][dec_place]
    end.reverse.join
  end

  private

  attr_reader :arabic_numeral
end