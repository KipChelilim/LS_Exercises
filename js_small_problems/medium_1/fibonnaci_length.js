/*
start 10am 1027
time 27min
takeaways
  still not following the algorithm, but first exercise of the day

Problem
  input: a BigInt number representing number of digits as `length`
  output: the nth position in fibonnaci sequence with bigint digits, where first position is 1
  rules:
    use BigInt numbers
    accept a number that indicates number of digits as `length`
    identify the first number in the fibonacci sequence that has number of digits equal to `length`
    fibonnaci sequence
      first two numbers are 1
      each number in the sequence is the sum of the previous numbers
    treat the first number in sequence as index position 1
    assume argument is always an integer greater than or equal to 2
  questions
    both input and output are BigInt format -> how should i handle non bigint format? n/a
    can input be any other format? no
    will the input ever be missing? no
    how should i handle extra inputs? ignore
Examples
  expected input:
    2 digit -> given
    large nums -> given
  malformed input:
  missing
  extra
  other special cases:
Data Structure
  array with sequence of last two digits
  variable to store current index position
  string to easily compare length
Algorithm
  initialize starting fibonnaci sequence with first 2 digit value as index 1
  initialize counter to store index position as 7 corresponding to first 2 digit value
    2 -> [8, 13], 7
  while last fibonnaci element length is less than target length
    update sequence
      push the sum of last element and return value from shifting first value of array
    increment counter
  return counter
*/

function findFibonacciIndexByLength(targetLength) {
  let sequence = [8n, 13n];
  let lastFibonacciIndex = 7n;

  while (String(sequence[1]).length < targetLength) {
    sequence.push(sequence[1] + sequence.shift());
    lastFibonacciIndex += 1n;
  }

  return lastFibonacciIndex;
}

console.log(findFibonacciIndexByLength(2n) === 7n);    // 1 1 2 3 5 8 13
console.log(findFibonacciIndexByLength(3n) === 12n);   // 1 1 2 3 5 8 13 21 34 55 89 144
console.log(findFibonacciIndexByLength(10n) === 45n);
console.log(findFibonacciIndexByLength(16n) === 74n);
console.log(findFibonacciIndexByLength(100n) === 476n);
console.log(findFibonacciIndexByLength(1000n) === 4782n);
console.log(findFibonacciIndexByLength(10000n) === 47847n);

// The last example may take a minute or so to run.