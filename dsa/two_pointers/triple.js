/*
time 1200 - 1233
  pause 1210 1215
  pause 1220 1230

Problem
  input: ordered array of int
  output: boolean
  rules:
    accept array of integers `nums`
      ? will nums ever be missing
      ? will nums ever be empty
      ? will nums ever be sparse
      ? will all elements be number types?
    find out if there is a distinct pair of elements (x, y) where (x * 3) === y
    return true or false if a match is found
Examples:
  expected input:
    - none
    - only one
    - multiple
  malformed input:
  missing:
  extra:
  other edge cases:
Data Structure:
  set containing nums[n] * 3
Algorithm
  initialize set
  for each element
    if set has num / 3 return boolean
    else add n * 3 to set
*/

function checkTripleMatch(nums) {
  let triples = new Set();

  for (let idx = 0; idx < nums.length; idx += 1) {
    if (triples.has(nums[idx])) return true;
    triples.add(nums[idx] * 3);
  }

  return false;
}

console.log(checkTripleMatch([1, 3, 9, 28]) === true);
console.log(checkTripleMatch([1, 2, 4, 10, 11, 12]) === true);
console.log(checkTripleMatch([0, 5, 7, 55]) === false);
console.log(checkTripleMatch([4, 5, 7, 9, 13, 15, 17]) === true);
console.log(checkTripleMatch([2, 6, 13, 54]) === true);
console.log(checkTripleMatch([1, 5, 17, 51]) === true);
console.log(checkTripleMatch([1, 2, 4, 8]) === false);

// All test cases should log true.