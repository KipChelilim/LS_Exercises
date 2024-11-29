/*
start 131 - 227
takeaways:
  debugging, started hacknslashing but recovered
  started overoptimizing and refactoring while debugging, remember to keep focus on refactor after
  brush up on when i am searching for a value (using === in conditional) vs
    narrowing to specific value to then take action, e.g.
      outer function is narrowing to a single value and then doing checks (action) outside the loop
      inner function is checking for a value as it it does the search so it needs ===
      
  after looking at the solution
    always think about how to model this after existing functions
    could have created a helper to find index of subarray and then passed that if valid
      instead of finding the targetarray and making it available outside block scope all in one

Problem:
  input: nested array `matrix` containing:
          nested subarrays containing
            integer number primitives
  output: boolean
  rules:
    - accept an array `matrix`
      - array matrix contains subarrays of various lengths
      - subarrays of matrix are:
        - sorted in ascending order
        - contain number types
      - matrix is sorted such that each element's final value is smaller than next element
    accept an integer `target`
    determine if target is an element within the array
    complexity needs to be O(log(M*N))

Examples
  expected input
    between elements -> new
    covered by last element -> given
    covered by first element -> given
    below all -> given
    above all -> given
    covered by mid element -> given
    more than 3 elements -> new
  malformed inputs
  missing
  extra
  other edge cases
Data Structures
Algorithm
  thoughts
    doing binary check still
    but check whether subarray covers/contains the target
    iterate while start < midpoint
    when it larger than last value, move start to mid + 1
    when it smaller than first value, move end to mid - 1
    when there's only one target,
      if it covers target do binary search within subarray and return result
    return false

    example 1: [[1, 3, 5], [7, 9, 11], [13, 15, 17]], 19
        midpoint of 1,
        first iteration, 19 is larger than last value (11), mid point, start is moved to 2
        no more iterations

    example 2: [[15, 25, 35], [45, 55, 65], [75, 85, 95]], 5
      midpoint is 1
      first iteration, target is less than first value (45), midpoint, end moved to 0
      second iteration only 1

      within, does not cover target, never return result of inner binary search
      return false by default

    example 3: [[4, 8, 12], [16, 20, 24], [28, 32, 36]], 14
      midpoint is 1
      first iteration
  main program
    initialize start
    initialize end
    while start < end
      initialize midpoint
      initialize largest
      initialize smallest

      if target > midpoint[length - 1]
        start midpoint + 1
      else target < midpoint [0]
        end midpoint - 1
      if target is between smallest and largest
        start = midpoint
        end = midpoint
    return target is covered and binarySearch(matrix[midpoint]);
  helpers:
    binarySearch(nums, target)
      initialize start
      initialize end

      while start < end
        initialize midpoint
        if start === midpoint
          return true
        else if start < midpoint
          start midpoint + 1
        else
          end midpoint - 1
      return false
*/

function findInNestedArray(matrix, target) {
  let start = 0;
  let end = matrix.length - 1;
  let targetArray;
  let smallest;
  let largest;

  while (start <= end) {
    let midpoint = Math.floor((start + end) / 2);
    targetArray = matrix[midpoint];
    smallest = targetArray[0];
    largest = targetArray[targetArray.length - 1];
    if (start === end) break;

    if (target > largest) {
      start = midpoint + 1;
      continue;
    } else if (target < smallest) {
      end = midpoint - 1;
      continue;
    } else {
      start = midpoint;
      end = midpoint;
    }
  }

  return (target >= smallest) && (target <= largest) && binarySearch(targetArray, target);
}

function binarySearch(arr, target) {
  let start = 0;
  let end = arr.length - 1;

  while (start <= end) {
    let mid = Math.floor((start + end) / 2);
    if (arr[mid] === target) {
      return true;
    } else if (arr[mid] < target) {
      start = mid + 1;
    } else {
      end = mid - 1
    }
  }

  return false;
}

console.log(findInNestedArray([[4, 8, 12], [16, 20, 24], [28, 32, 36]], 20) === true);
console.log(findInNestedArray([[3, 6, 9], [12, 15, 18], [21, 24, 27]], 27) === true);
console.log(findInNestedArray([[1, 3, 5], [7, 9, 11], [13, 15, 17]], 19) === false);
console.log(findInNestedArray([[10, 20, 30], [40, 50, 60], [70, 80, 90]], 10) === true);
console.log(findInNestedArray([[15, 25, 35], [45, 55, 65], [75, 85, 95]], 5) === false);
console.log(findInNestedArray([[4, 8, 12], [16, 20, 24], [28, 32, 36]], 14) === false);
console.log(findInNestedArray([[15, 25, 35], [45, 55, 65], [67, 68, 69], [75, 85, 95]], 75) === true);