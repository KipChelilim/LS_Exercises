/*
start
time
finish

Algorithm
  initialize object storing fib results for n
  if n is in table return lookup
  else
    assign lookup
    return result
*/

let fibonacciLookup = { 1: 1, 2: 1, }

function fibonacci(n) {

  if (n < 3) return fibonacciLookup[n];
  fibonacciLookup[n] ??= fibonacci(n - 1) + fibonacci(n - 2);

  return fibonacciLookup[n];
}

// console.log(fibonacci(1) === 1);
// console.log(fibonacci(2) === 1);
// console.log(fibonacci(3) === 2);
// console.log(fibonacci(4) === 3);
// console.log(fibonacci(5) === 5);
// console.log(fibonacci(12) === 144);
// console.log(fibonacci(20) === 6765);