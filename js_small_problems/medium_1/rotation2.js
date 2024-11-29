/*
start 3:07 - 3:46
time 39min
takeaways:
  ALGORITHM
  keep it simple
  dont try for the optimized solution
  relearn how splice works

Problem
  input:
    a number to rotate
    `n`, an integer specifying number of right most digits
  output: number with n digits rotated -> type is number
  rules:
    accept a number to be rotated
    accept another number n which specifies number of digits to rotate
    rotate the right most n digits where:
      the first digit moves to the end
      all other digits move left
  questions:
    will n always be less than or equal to number of digits in number? -> yes
    will n always be an integer? -> yes
    can n ever be less than 1? -> yes, it can be zero
    will n and number always be number types? yes
    does the rotation rule change if number is negative? no

Examples
  expected inputs:
    multidigit number, n positive integer less than length -> given
    multidigit number, n positive integer equal to length -> given
    n equal zero -> new test case
  malformed inputs:
    number
    n:
      n less than number of digits? -> given

Data Structure
  processing:
    array of digits
    2nd array for rotate digits
    concatenated array for final result
Algorithm
  if n < 2 return number
  convert number to a string
  split string into digits array
     0  1  2  3  4  5
    [7, 3, 5, 2, 9, 1]
  get lefthand side of digits not being rotated as `newDigits`
    slice from index 0 to length - n
    n = 1 -> slice 0 upto but not including 6 - 1 === 5
       0  1  2  3  4
      [7, 3, 5, 2, 9]
    n = 2 -> slice 0 up to but not including 6 - 2 === 4
       0  1  2  3
      [7, 3, 5, 2]
  get rigthand side of of digits being rotated
    slice -n
      n = 1 -> slice from -1 === slice from 5
        [1]
      n = 2 -> slice from -2 === slice from 4
        [9, 1]
  push slice from 1 of righthand side to left
    n === 2 -> push 1
       0  1  2  3  4
      [7, 3, 5, 2, 1]
  push first index from 1 to left
      n === 2 -> push 9
       0  1  2  3  4  5
      [7, 3, 5, 2, 1, 9]
  return newdigits joined with empty string as a delimiter converted to an integer
*/

function rotateRightmostDigits(number, n) {
  if (n < 2) return number;

  let digits = String(number).split('');
  let newDigits = digits.slice(0, digits.length - n);
  let rightmostDigits = digits.slice(-n);

  newDigits.splice(newDigits.length, 0, ...rightmostDigits.slice(1));
  newDigits.push(rightmostDigits[0]);

  return parseInt(newDigits.join(''), 10);
}

// multidigit number, n positive integer equal to length
console.log(rotateRightmostDigits(735291, 1) === 735291);
console.log(rotateRightmostDigits(735291, 2) === 735219);
console.log(rotateRightmostDigits(735291, 3) === 735912);
console.log(rotateRightmostDigits(735291, 4) === 732915);
console.log(rotateRightmostDigits(735291, 5) === 752913);
console.log(rotateRightmostDigits(735291, 6) === 352917);

// n equal zero
console.log(rotateRightmostDigits(735291, 0) === 735291);
