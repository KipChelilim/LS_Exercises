const integerToString = function numberToString(num) {
  if (1 / num === Infinity) return '0';
  if (1 / num === -Infinity) return '-0';

  let digits = [];
  let remainingDigits = Math.abs(num);

  while (remainingDigits > 0) {
    let digit = remainingDigits % 10;
    digits.unshift(digit);
    remainingDigits = Math.floor(remainingDigits / 10);
  }

  return num > 0 ? digits.join('') : '-' + digits.join('');
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
console.log(integerToString(-5000));      // "5000"
console.log(integerToString(-0) === "-0");