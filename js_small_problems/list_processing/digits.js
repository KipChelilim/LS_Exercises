/**
  * input: positive integer
  * output: sum digits of positive integers
  * requirements:use only method calls
*/

const sum = (integer) => {
  let stringDigits = integer.toString().split('');
  return stringDigits.reduce((sum, digit) => sum + parseInt(digit, 10), 0);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45