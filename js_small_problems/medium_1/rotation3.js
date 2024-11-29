/*
start 10:16 - 11:21
time
takeaways
  ALGORITHM
  STOP TRYING TO MAKE THE CLEVER SOLUTION
    brute force works at this problem scale
    overoptimization of a problem that doesn't need it

Problem
  input: number
  output: maximum rotation of number
  rules:
    rotate the full number, then keep the first digit fixed
    rotate the remaining digits, and then keep the 2nd digit fixed
    continue until the final two digits get rotated
    if the first digit becomes a leading zero, it gets dropped

    shortcut:
      every odd index number is returned as leading digits
      all other index positions rotate trailing n digits
        where n is number of remaining digits, decreasing by 1 each iteration
Examples
  expected inputs
    one digit -> given
    two digits -> given
    more than 2 -> given
      735291
        leading digits -> 3 2 1
        trailing before rotation -> 7 5 9
          first rotation, n === 3 -> 597
          second rotation, n === 2 -> 579
          third rotation, n === 1 -> 579
    leading zero in first odd index position
      105:
        shortcut
          keep 0 as leading
          trailing before rotation: 1 5
            first rotation, n === 2 -> 51
            second rotation, n === 1 -> 51
        long way
          first rotation -> 051
          second rotation -> 015
          third rotation -> 015
  malformed inputs
    assume proper number, base 10 digit
  missing
    assume no
  extra
    ignore
  other edge cases & special processing
Data Structure
  array for result of each digit
  second array of trailing digits to rotate
Algorithm
  convert number to string
  if length of digits array < 2 return number
  initialize rotateDigits to hold value after each rotation
  n times, where n === number of digits in number
    get `rightmostDigits` as length of number - current idx starting from 0
    reassign rotated digits to return of rightmostdigits
      call rightmostdigits with trailing digits and rightmostDigits
  return rotated digits base 10
*/

function maxRotation(number) {
  let numberString = String(number);
  if (numberString.length < 2) return number;

  let rotatedDigits = numberString;
  let rotationLimit = numberString.length;

  for (let i = 0; i < rotationLimit; i += 1) {
    let rightmostDigits = rotationLimit - i;
    rotatedDigits = rotateRightmostDigits(rotatedDigits, rightmostDigits);
  }

  return parseInt(rotatedDigits, 10);
}

function rotateRightmostDigits(numberString, n) {
  if (n < 2) return numberString;

  let digits = numberString.split('');
  let newDigits = digits.slice(0, digits.length - n);
  let rightmostDigits = digits.slice(-n);

  newDigits.splice(newDigits.length, 0, ...rightmostDigits.slice(1));
  newDigits.push(rightmostDigits[0]);

  return newDigits.join('');
}

console.log(maxRotation(735291) === 321579); //
console.log(maxRotation(3) === 3); //
console.log(maxRotation(35) === 53); //
console.log(maxRotation(105) === 15); //-- the leading zero gets dropped
console.log(maxRotation(8703529146) === 7321609845); //