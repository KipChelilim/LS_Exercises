function shift(array) {
  if (array.length === 0) return undefined;
  let firstElement = array[0];
  let lastIndex = array.length - 1;

  for (let index = 0; index < lastIndex; index += 1) {
    array[index] = array[index + 1];
  }

  array.length -= 1;
  return firstElement;
}

function unshift(array, ...elements) {
  let orgArray = array.slice();
  for (let index = 0; index < elements.length; index += 1) {
    array[index] = elements[index]
  }

  let orgValuesIndex = elements.length
  for (let index = 0; index < orgArray.length; index += 1) {
    array[orgValuesIndex] = orgArray[index];
    orgValuesIndex += 1;
  }

  // return array;
  return array.length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]