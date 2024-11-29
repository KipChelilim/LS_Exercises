/*
time 633 - 653

Problem
  input: array of numbers sorted ascending, and an integer
  output: boolean
  rules:
    accept an array `nums`
      - contains numbers sorted in ascending order
      - numbers can be duplicates
      - array can be of any length, not empty
      - can contain repeats of a single number
    accept a number `target`
    determine if target is in the array
    determine if the target is repeated 4 times
    return true if repeated 4 times and false if not
Examples
  expected input:
    repeated 3 or less times
    repeated 4 times
Data Structure
  same array, just pointers
Algorithm

  main program
    initialize start, end
    initialize firstIndex to indexOfTarget(array, target)
    if firstIndex is null return false
    firstIndex + 3 === target
  helper
    indexOfTarget(arr, target)
      binary search
*/

function isTargetFrequent(nums, target) {
  let firstIndex = firstIndexOfTarget(nums, target);
  if (firstIndex === null) return false;
  return nums[firstIndex + 3] === target;
}

function firstIndexOfTarget(arr, target) {
  let start = 0;
  let end = arr.length - 1;

  while (start < end) {
    let mid = Math.floor((start + end) / 2);

    if (arr[mid] < target) {
      start = mid + 1;
    } else {
      end = mid;
    }
  }

  return arr[start] === target ? start : null;
}

console.log(isTargetFrequent([1, 2, 3, 3, 3, 3, 4], 3) === true);
console.log(isTargetFrequent([1, 1, 1, 1, 2, 3, 4], 1) === true);
console.log(isTargetFrequent([1, 2, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([1, 1, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([2, 2, 2, 3, 3, 3, 4], 3) === false);
console.log(isTargetFrequent([4, 4, 4, 4, 4, 4, 4], 4) === true);