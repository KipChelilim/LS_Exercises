function reverse(inputForReversal) {
  let reversedInput;
  let toReversed;

  if (Array.isArray(inputForReversal)) {
    reversedInput = [];
    toReversed = (element) => reversedInput.push(element)
  } else {
    reversedInput = '';
    toReversed = (char) => reversedInput += char
  }

  for (let index = inputForReversal.length - 1; index >= 0; index -= 1) {
    toReversed(inputForReversal[index])
  }

  return reversedInput;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]