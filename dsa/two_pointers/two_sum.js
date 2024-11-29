/*
time 415 - 537; 82 - 27 -> 55min
  pause 4:31 - 458
takeaways
  - alot of time playing with the idea of a hash lookup
  - should've solved then thought about optimization
  - waas trying to avoid sorting algorithm

Problem
  input:
    - array of integers `nums`
    - integer `target`
  output: integer value
  rules:
    - accept an array of integers `nums`
      - nums will always have at least two values
      - nums will only contain number types that are 0 or greater integers
    - accept an input `k`
      - k will always be 2 or greater
      - k will always be provided
      - k will always be an integer and never infinity or nan
    - a maximum sum must:
      - be made up of distinct numbers
      - be less than k
      - be the sum of two numbers present in the array
    - find the maximum sum that meets the above criteria
    - if a maximum sum is not present, return -1
  questions:
    nums
      - will all numbers in nums be positive? -> yes
      - can nums ever be empty? -> no
      - can nums ever contain non number values? -> no
      - can nums ever have non number types that can be converted to number values? -> no
      - will numbers ever be 0? -> yes
      - will nums always have at least 2 values? -> yes
      - can nums ever have a NaN or infinity? -> no
    k
      - will k ever be less than 1?
      - will k ever be missing?
      - will k ever be infinity or nan?
    processing
      -
Examples:
  expected inputs: array of positive integers and k is 2 or greater
    - sum is present:
      - k is larger than largest value -> given
      - k is smaller than largest value -> given
      - max sum is k - 1 -> given
      - max sum is less than k - 1 -> given
      - multiple pairs present -> given
    - sum is not present:
      - k is smaller than smallest value -> given
      - sum can only be made by doubling an integer -> new
      - k is larger, but no match -> new (same as above)
  malformed inputs:
  missing
  extra
  other edge cases:


  [97, 2, 4, 98, 9, 5, 10, 1, 7], 100
    - highest max sum possible is 99
    - on first iteration i can calculate what value is needed to reach 99 for each element
    - if no element has its required value, i can reduce the potential max sum by 1
    -

Data Structure
  - hash table to speed up the lookup for the max value
  - single pointer to iterate through array
  - running max sum value
Algorithm
  initialize potentialMaxSum as target - 1
  initialize currentMaxSum as 0
  initialize pointers start as 0
  while start < array length - 2
    initialize end as start + 1
    while end pointer is less than array length
      if start value and end value sum === potentialMaxSum return potentialMaxSum
      if sum is > maxSum store it in max sum
      increment end pointer
    increment start pointer
  return maxSum;
*/

function twoSumLessThanTarget(nums, k) {
  let potentialMaxSum = k - 1;
  let currMaxSum = -1;
  let start = 0

  while (start < nums.length - 1) {
    let end = start + 1;

    while (end < nums.length) {
      if (nums[start] === nums[end]) continue;

      let sum = nums[start] + nums[end];
      if (sum === potentialMaxSum) return sum;
      currMaxSum = Math.max(currMaxSum, sum);
      end += 1;
    }

    start += 1;
  }

  return currMaxSum;
}

console.log(twoSumLessThanTarget([3, 1, 4], 5) === 4);
console.log(twoSumLessThanTarget([8, 2, 4, 9, 5, 10, 1, 7], 16) === 15);
console.log(twoSumLessThanTarget([5, 8, 3, 2, 1], 6) === 5);
console.log(twoSumLessThanTarget([6, 8, 10, 12], 5) === -1);
console.log(twoSumLessThanTarget([1, 2, 3, 4, 5], 100) === 9);
console.log(twoSumLessThanTarget([10, 20, 30, 40, 50], 40) === 30);
console.log(twoSumLessThanTarget([7, 4, 15, 11, 21, 9], 24) === 22);
console.log(twoSumLessThanTarget([2, 4], 5) === -1);
console.log(twoSumLessThanTarget([2, 4], 6) === -1);
