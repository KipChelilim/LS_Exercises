=begin
PEDAC
  start 735
  finish 7:44
  time 9mins
Problem
  rules
    accept three integer arguments representing angles in degrees
    determine if the angles make up a valid trianlge
      sume of angles == 180 exactly
      all angles must be greater than 0
    determine the type of triangle
      right: one angle is a right angle
      acute: all three less than 90
      obtuse: one greater than 90
Algorithm
  validity check
  largest angle
  right: == 90
  obtuse: > 90
  acute: < 90
=end

def triangle(angle_1, angle_2, angle_3)
  angles = [angle_1, angle_2, angle_3].sort
  if angles.sum != 180 || angles.any?(0)
    :invalid
  elsif angles[-1] == 90
    :right
  elsif angles[-1] > 90
    :obtuse
  elsif angles[-1] < 90
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid