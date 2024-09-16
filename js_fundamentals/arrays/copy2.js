let myArray = [1, 2, 3, 4];
// const myOtherArray = myArray.slice(); // Option 1
const myOtherArray = Array.from(myArray); // Option 2

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);