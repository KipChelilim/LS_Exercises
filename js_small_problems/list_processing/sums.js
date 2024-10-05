/**
  * input array of numbers
  * output: sum of running totals
  * algorithm: transform into running totals, then sum those totals
  *   - map, then reduce
  *   - for map => create a function that calculates a running total and pass that as callback
  * running total function:
      - get slice up to current index
      - sum values in slice
      - return sum
*/
const sumOfSums = (array) => {
  const runningTotal = (value, idx) => {
    return array.slice(0, idx + 1).reduce((sum, value) => sum + value);
  }

  return array.map(runningTotal).reduce((sum, value) => sum + value);
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35