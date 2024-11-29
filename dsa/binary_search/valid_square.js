/*
time 700 - 714


*/

function isSquareInteger(num) {
  let start = 1;
  let end = num;

  while (start <= end) {
    let mid = Math.floor((start + end) / 2);
    let squareInteger = mid ** 2

    if (squareInteger === num) {
      return true;
    } else if (squareInteger > num) {
      end = mid - 1;
    } else {
      start = mid + 1
    }
  }

  return false;
}


console.log(isSquareInteger(1) === true);
console.log(isSquareInteger(4) === true);
console.log(isSquareInteger(16) === true);
console.log(isSquareInteger(14) === false);
console.log(isSquareInteger(25) === true);
console.log(isSquareInteger(26) === false);
