=begin
PEDAC
  start 6:42
  finish 7:02
  time 20min
Problem
  rules
    accept 3 numeric arguments for the sides of a triangle
    identify the type of triangle based on the sides
      equilateral: all three sides are equal
      isosceles: 2 sides of equal length, 3rd side is different
      scalene: all three sides of equal length
      invalid:
          lengths must all be greater than 0
          sum of two shortest lengths should be greater than length of the longest side
    return the type of triangle as a symbol
  clarifying questions
Examples: see examples below
  invalid due to zero
  invalid due to short side
  equilateral
  isosceles
  scalene
Data:
  input: three integer or float arguments
  intermediate:
    array to handle sides
  output: symbol of type or invalid
Algorithm
  put numbers into an array and sort it
  check for validity:
    if sum of first two elements is not greater than last element, invalid
    if any number is zero, invalid
  check for type of triangle
    if there is  1 uniq value then equilateral (uniq.size == 1)
    if there are 2 uniq values then isosceles
    if there are 3 uniq values then scalene
  return the type
=end

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3].sort
  return :invalid if sides.any?(0) || (sides[0..1].sum <= sides[-1])

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1.5, 1.5) == :invalid