/*
time 1046 - 1137 51 min
takeaways:
  - stuck in debugging, could've been faster there

Problem
  input: sorted array of integers
  output: integer count
  rules:
    accept a sorted array of integers `nums`
      - array is sorted ascending
      - elements are integer number types
        ? are they always integers
        ? are they always number types
      - will the array ever be empty?
      - numbers are not always consecutive (e.g. 1, 3, 5 or 1, 2, 3 equally possible)
      ? can it ever be missing
      ? will there ever be duplicates?
    accept a number value `target`
      ? will it always be an integer
      ? can it ever be missing?
      ? will it ever be a number that requires converstion to the right type (e.g. string '1')
    identify pairs whose sum is greater than `target`
    pairs must be unique (e.g. 1, 2 is the same as 2, 1)
    return the count of unique pairs
Examples
  expected inputs: all integer number types
    - no pairs, all below target -> given
    - no pairs, all equal to target -> added
    - 1 pair -> given
    - more than 1 pair -> given
    - duplicate pair -> given
    - duplicate values -> added
    - non-consecutive elements -> given
  malformed inputs:
  missing:
  extra:
  other edge cases:
Data Structure:
  set of string pairs (e.g. `12` to denote a pair), can check if this is already represented
    - add to the set as reverse of current value
    - e.g. if checking 2 + 1 > 1, add '12' to prevent adding this as a count later
Algorithm
  initialize start
  initialize counter
  initialize set
  while start is less than length of nums
    initialize end pointer to last element
    if start + end <= target, continue
    while end >= 0
      if start + end > target,
        increase counter
        add `#{end}#{start}` to set
      else if start + end <= target, break
      decrement end
*/

function countPairs(nums, target) {
  let s = 0;
  let uniquePairs = new Set();

  while (s < nums.length - 1) {
    let e = nums.length - 1;

    while (e > s) {
      let sValue = nums[s]
      let eValue = nums[e]

      if (sValue + eValue <= target) break;
      uniquePairs.add(`${sValue}${eValue}`);
      e -= 1;
    }

    s += 1;
  }

  return uniquePairs.size;
}

console.log(countPairs([1, 2, 3, 4, 5], 6) == 4);
// Pairs: (2, 5), (3, 4), (3, 5), (4, 5)

console.log(countPairs([1, 2, 3, 4, 5], 8) == 1);
// Pair: (4, 5)

console.log(countPairs([1, 3, 5, 7], 6) == 4);
// Pairs: (1, 7), (3, 5), (3, 7), (5, 7)

console.log(countPairs([1, 2, 3, 4], 5) == 2);
// Pairs: (2, 4), (3, 4)

console.log(countPairs([1, 2, 3, 4, 5], 10) == 0);
// No pairs

console.log(countPairs([1, 2, 3, 4, 5], 9) == 0);
console.log(countPairs([1, 2, 2, 2, 3, 4], 5) == 2);
