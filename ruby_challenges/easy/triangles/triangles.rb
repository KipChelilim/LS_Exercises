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

# After refactoring
class Triangle
  def initialize(*lengths)
    @sides = lengths
    raise ArgumentError, "Invalid side lengths" unless valid_lengths?(sides)
  end

  def kind
    case sides.map(&:to_f).uniq.size # From student solution, need to control for mixed types
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  private

  attr_accessor :sides

  def valid_lengths?(sides)
    (sides.all? { |num| num > 0}) &&
      (sides.min(2).sum > sides.max) &&
      (sides.size == 3) # Check number of arguments due to splat operator (ln 20)
  end
end