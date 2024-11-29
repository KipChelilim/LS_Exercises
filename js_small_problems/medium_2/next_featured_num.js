/*
start 1124 - 12, 1227 - 1239
time
takeaways

Problem
  input: integer
  output: next "featured number"
  rules:
    a featured number is an odd number that is a multiple of 7 with no duplicate digits
      e.g. 49 is odd and a multiple of 7 -> yes
           98 is even, and multiple of 7 -> no
           133 odd, multiple of 7, but duplicate digits -> no
    largest possible featured number is 9876543201
    goal is to get the next largest featured number
    has to be the next largest, i.e entering the largest possible should yield error message
    the error message should be: ""There is no possible number that fulfills those requirements."
  questions:
    will the input always be a number type integer? can it be another type?
    will the input always be provided or can it be missing?
    will there every be extra inputs?
    can the input ever be negative?
    is it possible to have a negative featured number?
    if its possible to have a negative featured number, is the smallest featured number -9876543201?
  summary:
    accept an integer number type
      the argument will always be provided
      the argument can be negative
      there will only be one
    identify the next highest "featured number" where:
      the number has only unique digits
      the number is odd
      the number is a multiple of 7
    if there is no next highest featured number, return an error message (see above)
Examples
  - expected inputs: integer value
    - next multiple is featured number -> given
    - next multiple is not odd -> given
    - next multiple has non-unique digits -> given
    - next multiple has
    - given input is not a multiple of 7 -> given
    - given input is a multiple of 7 -> given
    - negative
  - other processing/special cases
    - error if larger than featured number -> given
    - short circuit to smallest featured number if smaller - new test case
Data Structure
  - input: integer primitive
  - processing:
    - string & array to test uniqueness digits -> helper function
    - integer values
  - output: integer value
Algorithm
  - main program
    - if num is greater than 9876543201, return error message
    - if num is less than smallest featured number, return smallest number
    - get next value that is an odd multiple of 7 as `currentValue` (nextOddMultipleOf7)
    - while currentvalue is less than or equal to 9876543201
      - if currentvalue hasUniqueDigitsOnly, return value
  - helpers:
    - nextOddMultipleOf7:
      - get num % 7
        - 12 % 7 === 5
        - 997 % 7 === 3
      - add 7 - remainder to current num
        - 997 + (7 - 3) === 1001
      - if current num is even, add 7
        14 + 7 === 21
        1001 === 1001
      - return that value
    - hasUniqueDigitsOnly:
      - convert to string
      - split to digits
      - filter for any values where indexOf !== lastIndexOf
        1001 -> index of 1 and index of 2
      - return boolean of length of result === 0
        1001 -> false
*/

function featured(num) {
  const errorMessage = 'There is no possible number that fulfills those requirements.';
  if (num >= 9876543201) return errorMessage;
  if (num < -9876543201) return -9876543201;

  let currentValue = nextOddMultipleOf7(num);

  for (; currentValue <= 9876543201; currentValue += 14) {
    if (hasUniqueDigitsOnly(currentValue)) return currentValue;
  }

  return errorMessage;
}

function nextOddMultipleOf7(num) {
  let delta = 7 - (num % 7);
  let multipleOf7 = num + delta;
  return multipleOf7 % 2 !== 0 ? multipleOf7 : multipleOf7 + 7;
}

function hasUniqueDigitsOnly(num) {
  let digits = num.toString().split('');
  let duplicates = digits.filter((digit) => digits.indexOf(digit) !== digits.lastIndexOf(digit));
  return duplicates.length === 0;
}

console.log(featured(12) === 21);
console.log(featured(20) === 21);
console.log(featured(21) === 35);
console.log(featured(997) === 1029);
console.log(featured(1029) === 1043);
console.log(featured(999999) === 1023547);
console.log(featured(999999987) === 1023456987);
console.log(featured(9876543186) === 9876543201);
console.log(featured(9876543200) === 9876543201);
console.log(featured(9876543201) === "There is no possible number that fulfills those requirements.");
console.log(featured(-9876543301) === -9876543201);
