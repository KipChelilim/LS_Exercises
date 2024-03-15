=begin
Time
  start 1016
  finish 1136 started spinning in algo, then hack n slash - had to check solution,
    was 90% of way there
  time 1hr 20min
  refactor
Problem
  accept a `letter` as an input
  create a diamond with the letter at the widest point
  each line of diamond has 2 characters at widest points for that line
    (or 1 chr for the top and bottom)
  diamond should be symetric
  top half should have letters in descending order
  bottom half should have letters in ascending order

  test cases:
    each line (even if just A) should end in new line
    class `Diamond`
    class method `make_diamond` accepts one argument, single letter as string
Example
  C:
       A
      B B
     C   C
      B B
       A

Algorithm
  take a letter
  determine width of diamond
  create first line of diamond
    width * 2 - 1
  reverse top half and return
=end

class Diamond
  def self.make_diamond(letter)
    letters = ("A"..letter)
    width = (letters.count * 2) - 1
    center_padding = 1.step(by: 2)

    diamond = letters.each_with_object([]) do |letter, lines|
      lines << make_a_line(letter, center_padding).center(width)
    end

    diamond.concat(diamond[0..-2].reverse!) unless letter == "A"
    diamond.join("\n") + ("\n")
  end

  class << self

    private

    def make_a_line(letter, padding)
      if letter == "A"
        "#{letter}"
      else
        "#{letter}#{" " * padding.next}#{letter}"
      end
    end
  end
end