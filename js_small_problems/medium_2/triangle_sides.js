/*
start 337 - 422
time 45
takeaways
  why are you refactoring in the middle of the solution

Problem
  input: three numbers representing side lengths of a triangle
  output: triangle classification as string; possible values:
    equilateral, isosceles, scalene, invalid
    others?
  rules:
    a valid triangle meets the following criteria:
      sum of the two shortest side lengths must be greater than longest side
      every side must have length greater than 0
    a valid triangle has three classifications
      equilateral: all three sides are equal length
      isosceles: two sides equal length, third is different
      scalene: all three are different lengths
  requirements:
    accept numeric values representing side lengths of a triangle
    determine if the triangle is valid
    if the triangle is valid, determine its category
    return the classification or invalid based on the above test
    the return value should be a string
  questions:
    are there other potential return values for this function? -> no
    will inputs always be 3 distinct number data types? -> no
    how should i handle missing inputs? give invalid
    hw
Examples
  expected inputs:
    equilateral -> given
    isosceles -> given
    scalene -> given
    invalid 0 -> given
    invalid not greater than longest side  -> given
    invalid negative -> new test case
  malformed inputs:
  missing: new test case
  extra:
  other special cases:
Data Structures
  - put lengths in an array to sort for shortest side lengths
  - callback function for sorting
  - string final output
  - number comparisons
Algorithm
  main program
    - collect values into an array
    - sort array smallest to largest - sort callback function
    - test for valid triangle and return invalid if not
      - if array[0] <= 0
      - if sum of array[0] and array[1] < array[2]
    - test for equilateral
      - if array0 === array1 and array1 === array2
    - test for isosceles
      - if array0 === array1 || array0 === array2 || array1 === array2
    - return scalene

  sorting callback:
    if a < b return -1
    if a > b return 1
    else return 0
*/

function triangle(side1, side2, side3) {
  let sides = [side1, side2, side3];
  [side1, side2, side3] = sides.sort(numericSort);

  if (!isValidTriangle(side1, side2, side3)) return 'invalid';
  if (isEquilateralTriangle(side1, side2, side3)) return 'equilateral';
  if (isIsoscelesTriangle(side1, side2, side3)) return 'isosceles';
  return 'scalene';
}

function isValidTriangle(side1, side2, side3) {
  return (side1 > 0) && ((side1 + side2) > side3);
}

function isEquilateralTriangle(side1, side2, side3) {
  return side1 === side2 && side1 === side3;
}

function isIsoscelesTriangle(side1, side2, side3) {
  return (side1 === side2 && side1 !== side3) ||
    (side1 === side3 && side1 !== side2) ||
    (side2 === side3 && side2 !== side1)
}

function numericSort(a, b) {
  if (a < b) return -1;
  if (a > b) return 1;
  return 0;
}

console.log(triangle(3, 3, 3) === "equilateral");
console.log(triangle(3, 3, 1.5) === "isosceles");
console.log(triangle(3, 4, 5) === "scalene");
console.log(triangle(0, 3, 3) === "invalid");
console.log(triangle(3, 1, 1) === "invalid");
console.log(triangle(1, -1, 1) === "invalid");
console.log(triangle(3, 3) === "invalid");