function concat(array1, ...arguments) {
  let newArray = array1.slice();

  for (let index = 0; index < arguments.length; index += 1) {
    let currentArgument = arguments[index];
    if (Array.isArray(currentArgument)) {
      currentArgument.forEach((element) => newArray.push(element));
    } else {
      newArray.push(currentArgument);
    }
  }

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]