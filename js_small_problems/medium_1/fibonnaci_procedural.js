/*
start 1147 - 1156
time 9min
takeaways

Algorithm
  start with [1, 1] as sequence
  reassign values to sums n - 2 times, where n is the input
  use bigint numbers
*/

function fibonacci(n) {
  if (n === 1) return 1;

  let [previous, current] = [1, 1];
  let limit = n - 2;

  for (let i = 0; i < limit; i += 1) {
    [previous, current] = [current, current + previous]
  }

  return current;
}

console.log(fibonacci(20) === 6765);
console.log(fibonacci(50) === 12586269025);
console.log(fibonacci(75) === 2111485077978050);