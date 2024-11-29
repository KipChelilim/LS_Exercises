/*
time: 154 200

Problem

*/

function countDigits(num) {
  if (num === 0) return 1;
  if (num < 1) return 0;
  return 1 + countDigits(num / 10);
}




console.log(countDigits(12345) === 5);
console.log(countDigits(7) === 1);
console.log(countDigits(100000) === 6);
console.log(countDigits(99999) === 5);
console.log(countDigits(0) === 1);

// All test cases should log true.