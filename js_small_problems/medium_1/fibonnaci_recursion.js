/*
start 1138 - 1146
time 8min
takeaways

Problem
  - input: desired fibonacci number in sequence as `n`
  - output: nth fibonacci number
  - rules:
    - first fibonacci number is n === 1
    - use recursion
Algorithm:
  - break condition:
    if n < 3, return 1
  - return fibonacci(n) + fibonacci(n - 1)
*/

function fibonacci(n) {
  if (n < 3) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

console.log(fibonacci(1) === 1);
console.log(fibonacci(2) === 1);
console.log(fibonacci(3) === 2);
console.log(fibonacci(4) === 3);
console.log(fibonacci(5) === 5);
console.log(fibonacci(12) === 144);
console.log(fibonacci(20) === 6765);