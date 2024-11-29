/*
start 134 - 224 50 min
takeaways:
  - could've done two pointer and kept start and end at same distance, incrementing both
    - would've just had to iterate from start up to end
    - could've followed my initial thought of just adding each new element and subtracting previous
  - would've been more straightforward than runner anchor
  - revisit best practices for chosing betwen the two during two pointer strat lessons

Problem
  input: array of nums, integer k
  output: array of averages
  rules:
    - accept an input nums
      - nums will contain integers positive zero or negative that are number types
      - will not be empty
      - will not be infinity
    - accept an input k
      - k is a positive integer
      - k will always be less than or equal to the length of nums
    - get each contiguous subarray of size k from nums
      - start from the beginning of the array
      - include each element from start up to start + k - 1
      - slide the window forward by 1 element each time
      - stop when window exceeds last element of array
    - for each subarray, calculate the average
  questions:
    nums
      - will the numbers in nums always be integers? -> yes
      - will they ever by NaN or Infinity? -> no
      - will they always be a number type? -> yes
      - will nums ever be empty? -> no
      - will nums ever have less than 3 numbers -> no
      - should i control for non-array input?
    k
      - will k always be at least 1? -> yes
      - will it ever be omitted? -> no
      - will it ever be larger than the length of nums? -> no
    averages
      - should the average be of a specific precision? -> yes max of 2 decimal places
Examples:
  expected inputs:
    nums:
      - all positive -> given
      - all negative -> new
      - mix of the two -> given
    k: anything greater than 1 -> given
    combination:
      k is equal to nums length -> new
      k is less than nums length -> given
  malformed inputs:
    non number types n/a
    wrong input types n/a
    exceeds nums length n/a
  missing: n/a
  extra: n/a
  other edge cases:
Data Structure:
  - number value to store total
Algorithm
  initialize anchor to 0
  initialize runner to anchor + 1
  initialize averages to []

  while anchor + k < nums.length
    let total = 0
    let limit = anchor + k - 1
    while runner < limit
      add value at runner to total
      increment runner
    push total / k toFixed(2) to averages
    increment anchor by 1

  return averages
*/

function findAverages(nums, k) {
  let anchor = 0;
  let averages = [];

  while (anchor + k <= nums.length) {
    let runner = anchor;
    let total = 0;
    let limit = anchor + k;

    for (; runner < limit; runner += 1) {
      total += nums[runner];
    }

    averages.push(total / k);
    anchor += 1;
  }

  return averages;
// }

console.log(findAverages([1, 2, 3, 4, 5, 6], 3)); // [ 2, 3, 4, 5 ]
console.log(findAverages([1, 2, 3, 4, 5], 2));    // [1.5, 2.5, 3.5, 4.5]
console.log(findAverages([10, 20, 30, 40, 50], 4)); // [ 25, 35 ]
console.log(findAverages([5, 5, 5, 5, 5], 1));      // [ 5, 5, 5, 5, 5 ]
console.log(findAverages([1, 3, 2, 6, -1, 4, 1, 8, 2], 5)); // [2.2, 2.8, 2.4, 3.6, 2.8]
console.log(findAverages([-5, -5, -5, -5, -5], 1));      // [ -5, -5, -5, -5, -5 ]
console.log(findAverages([2, 2, 2, 2, 2], 5)); // [2]
