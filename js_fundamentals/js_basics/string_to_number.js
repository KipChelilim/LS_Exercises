const stringToInteger = function stringIntegerConversion(str) {
  const ZERO_CHAR_CODE = '0'.charCodeAt(0);
  const SIGNS = ['+', '-'];

  let startingIndex = SIGNS.includes(str[0]) ? 1 : 0;
  let sign = str[0] === '-' ? -1 : 1;
  let chars = str.slice(startingIndex).split('');
  let digits = chars.map(char => char.charCodeAt(0) - ZERO_CHAR_CODE);

  let sum = digits.reduce((total, element) => (total * 10) + element);
  return sum * sign;
}



console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
console.log(stringToInteger('-570'));       // 570
console.log(stringToInteger('+570'));       // 570