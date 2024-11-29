/*
time: 206 210
takeaways:

Algorithm
  further exploration
    helper(num, exponent = abs value
      if power = 0 return 1

      result = n * recursive call exp - 1
    if exp negative, return 1 / result

*/

function power(num, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp < 0) {
    return (1 / num) * power(num, exp + 1);
  } else {
    return num * power(num, exp - 1);
  }
}

console.log(power(2, 3) === 8);
console.log(power(5, 0) === 1);
console.log(power(3, 4) === 81);
console.log(power(7, 2) === 49);
console.log(power(10, 1) === 10);

console.log(power(2, -3));
console.log(power(3, -4));
console.log(power(7, -2));
console.log(power(10, -1));


// All test cases should log true.