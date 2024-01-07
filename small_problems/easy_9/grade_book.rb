=begin
PEDAC
  start 305
  finish 312
  time 7min
Problem
  rules
    accept three numeric values as an input
    calculate an average of the numbers
    return a letter grade based on the average:
      90 <= score <= 100 	'A'
      80 <= score < 90  	'B'
      70 <= score < 80  	'C'
      60 <= score < 70 	  'D'
      0 <= score < 60 	  'F'
Algorithm
  calculate an average grade
  use grade and check if
    grade >= 90 => 'A'
    grade >= 80 => 'B'
    grade >= 70 => 'C'
    grade >= 60 => 'D'
    else           'F'
=end

def get_grade(grade1, grade2, grade3)
  grades = [grade1, grade2, grade3]
  average = grades.sum / grades.size
  case
  when average >= 90 then 'A'
  when average >= 80 then 'B'
  when average >= 70 then 'C'
  when average >= 60 then 'D'
  else                    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"