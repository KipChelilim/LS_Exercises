function stringy(num) {
  if (num < 1) return '';

  let string = '1';

  for (let count = 1; count < num; count += 1) {
    let currChar = string[count - 1] === '1' ? '0' : '1';
    string += currChar;
  }

  return string;
}

console.log(stringy(6) === "101010")
console.log(stringy(9) === "101010101")
console.log(stringy(4) === "1010")
console.log(stringy(7) === "1010101")