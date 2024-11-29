/*
start 11 - 1124
time: 24min
takeaways:
  solid pedac-ing, time is due to forcing questions and every step
  could do better with more abstraction
  extra time could be better served by talking about refactoring opportunities

Problem
  input: three angles of a triangle
  output: classification of triangle: right, acute, obtuse, or invalid
  rules:
    valid triangle: all angles sum to 180, all angles are greater than 0
    right angle: valid triangle and 1 angle is exactly 90
    acute: valid and all angles less than 90
    obtuse: valid and one angle greater than 90
    assume all angles have integer values, no floating point errors
    assume arguments are in degrees
  questions:
    malformed inputs:
      will all inputs be number type or can there be other data types that need conversion?
      since all angles should have integer values, will they be provided that way? rounding / trunc?
    missing / extra?
      how should i handle missing angles? -> treat as less than 0, return invalid
      how should i handle extra inputs? -> n/a
  summary:
    accept three integer numbers representing the angles of a triangle
    identify if the triangle is valid
      all inputs sum to 180 exactly
      every angle is greater than 0
      all angles present
      all angles are valid numbers
    if the triangle is valid, identify the type of triangle
      right: identify if exactly one angle is 90 degrees
      acute: identify if all angles are less than 90 degrees
      obtuse: identify if one angle is greater than 90 degrees
    return the classification of the angle as a string:
Examples
  expected inputs: all numbers, none missing
    invalid triangle single angle is less than 1 -> given
    invalid triangle, total is greater than 180 -> given
    right triangle -> given
    acute -> given
    obtuse -> given
  malformed inputs: n/a
  missing inputs: -> new test case
  other special cases?
Data Structures
  number types only, no need for an array given limited arg size
Algorithm
  return invalid if any arguments are missing
  return invalid if the sum of angles is not equal to 180
  return invalid if the min angle is less than 1

  if max angle is greater than 90 return obtuse
  if max angle is less than 90 return acute
  else return right
*/

function triangle(angle1, angle2, angle3) {
  if (!(angle1 && angle2 && angle3)) return 'invalid'; 
  if (Math.min(angle1, angle2, angle3) < 1) return 'invalid';
  if ((angle1 + angle2 + angle3) !== 180) return 'invalid';

  if (Math.max(angle1, angle2, angle3) > 90) {
    return 'obtuse';
  } else if (Math.max(angle1, angle2, angle3) < 90) {
    return 'acute';
  } else {
    return 'right';
  }
}


// invalid less than 1
console.log(triangle(0, 90, 90) === "invalid");

// invalid greater than 180
console.log(triangle(50, 50, 50) === "invalid");

// right
console.log(triangle(30, 90, 60) === "right");

// acute
console.log(triangle(60, 70, 50) === "acute");

// obtuse
console.log(triangle(120, 50, 10) === "obtuse");

// missing inputs:
console.log(triangle(50, 50) === "invalid");