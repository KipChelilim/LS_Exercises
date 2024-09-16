function areArraysEqual(array1, array2) {
  const stringNumberCompare = (a, b) => {
    if (typeof a !== typeof b && typeof a === 'number') {
      return -1;
    } else if (a < b) {
      return -1;
    } else if (a > b) {
      return 1;
    }

    return 0;
  }

  sortedArray1 = array1.slice().sort(stringNumberCompare)
  sortedArray2 = array2.slice().sort(stringNumberCompare)

  for (let index = 0; index < array1.length; index += 1) {
    if (sortedArray1[index] !== sortedArray2[index]) return false;
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true