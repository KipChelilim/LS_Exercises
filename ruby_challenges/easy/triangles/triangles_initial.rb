=begin
start 400, finish 425
Problem:
explicit rules
  determine if a triangle is an isosceles, equilateral or scalene
    equilateral = all three sides have same lenght
    isosceles = exactly two sides have same length
    scalene = all three have different sides
  triangle must be valid
    all sides greater than 0
    sum of lengths of any two sides mus tbe greater than length of the third
implicit rules
  use a class Triangle
  implement a method `#kind` which returns the type of triangle
  return argument error if you try to instantiate with invalid side lengths
=end

class Triangle
  def initialize(length_1, length_2, length_3)
    raise ArgumentError, "Invalid side lengths" unless valid_lengths?(length_1, length_2, length_3)
    @side_1 = length_1
    @side_2 = length_2
    @side_3 = length_3
  end

  def kind
    all_sides = [side_1, side_2, side_3]
    case all_sides.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  private

  attr_accessor :side_1, :side_2, :side_3, :all_sides

  def valid_lengths?(length_1, length_2, length_3)
    sides = [length_1, length_2, length_3]
    (sides.all? { |num| num > 0}) && (sides.min(2).sum > sides.max)
  end
end