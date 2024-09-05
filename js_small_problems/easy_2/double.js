function isDoubleNumber(num) {
  let numString = num.toString();
  if (numString.length % 2 !== 0) return false;

  let firstHalfIndex = 0;
  let secondHalfIndex = Math.trunc(numString.length / 2)
  for (let index = 0; index < Math.trunc(numString.length / 2); index += 1) {
    if (numString[index] !== numString[secondHalfIndex]) return false;
    secondHalfIndex += 1;
  }

  return true;
}

function twice(num) {
  if (isDoubleNumber(num)) {
    return num;
  } else {
    return num * 2;
  }
}


console.log(twice(37) === 74)
console.log(twice(44) === 44)
console.log(twice(334433) === 668866)
console.log(twice(444) === 888)
console.log(twice(107) === 214)
console.log(twice(103103) === 103103)
console.log(twice(3333) === 3333)
console.log(twice(7676) === 7676)