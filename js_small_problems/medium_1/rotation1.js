/*
start: 12:48 - 1:34
time: 46min
takeaways
  - go back to the algorithm
  - started hack and slashing to solve
  - shallow copy of arrys that include properties - figure it out
  - after looking at the solution: really over complicated this one
    - good to practice
    - good to test boundary fo proficiency
    - hard to judge time management and controlling for 

Problem
  input: array of elements, or no aray
  output: new array
  rules:
    accept an array as an input
      the array can be empty, missing, or of a wrong data type
    if the input is not an array, return undefined
    if the input is an empty array, return an empty array
    rotate the array:
      move the first element to the end of the array
    do not modify the original array
  questions
    how should i handle properties on the input array? ignore them
    should all array elements be treated the same (i.e. ignore the data type of the element)? yes
    how should i handle sparse arrays? -> assume it won't be empty
    should the returned array be a shallow copy or a deep copy?
    how should i handle extra inputs? -> ignore them
    should an array with only properties be copied and returns with all properties? yes
Examples
  expected input:
    primitive as all elements -> given
    single element -> given
    object as at least one element -> given
    property on the array -> new test case
    empty array -> given
    array with only properties -> new test case
    non-array -> given
  malformed inputs -> n/a
  missing inputs? -> n/a
  extra inputs? -> new test case
  other test cases? -> n/a
Data Structure
  - array
  - slice of the array for shallow copy
Algorithm
  short circuit:
    if non array, return undefined
    if empty array return copy of empty array
    if array.length is equal to 1, return copy of the array
  main program:
    get a slice of the array from index position 1 onward as `rotatedArray`
    push element 0 from original array to `rotatedArray`
    return `rotatedArray`
  restore properties
    get all entries from original array
    filter out index "properties"
    for each property add it to the resulting array
*/

function rotateArray(array) {
  let properties = Object.entries(array).filter(([key, value]) => !(/^[0-9]+$/.test(key)));

  if (!Array.isArray(array)) return undefined;
  if (array.length === 0 && properties.length === 0) return [];
  if (array.length === 1) return array.slice(0);

  let rotatedArray = array.slice(1) || [];
  if (rotatedArray.length !== 0) rotatedArray.push(array[0]);

  properties.forEach(([key, value]) => rotatedArray[key] = value);

  return rotatedArray;
}

// primitives as all elements
// console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
// console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
// console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]

// // the input array is not mutated
// const array = [1, 2, 3, 4];
// console.log(rotateArray(array));                    // [2, 3, 4, 1]
// console.log(array);                                 // [1, 2, 3, 4]

// // single element
// console.log(rotateArray(['a']));                    // ["a"]

// // object as at least one element
// console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]


// // empty array
// console.log(rotateArray([]));                       // []

// // non-arrays
// // return `undefined` if the argument is not an array
// console.log(rotateArray());                         // undefined
// console.log(rotateArray(1));                        // undefined

// // extra inputs
// console.log(rotateArray([7, 3, 5, 2, 9, 1], 'extra', 'not needed'));       // [3, 5, 2, 9, 1, 7]

// // property on the array
// let propArray = ['a', 'b'];
// propArray.prop = 'one';
// console.log(rotateArray(propArray));                    // ["b", "a", prop: 'one']

// only properties on the array
let onlyProperties = [];
onlyProperties.prop1 = 'one';
onlyProperties.prop2 = 'two';
console.log(rotateArray(onlyProperties));                    // [pro1: 'one', pro2: 'two']

