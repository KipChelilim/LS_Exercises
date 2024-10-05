const buyFruit = (array) => {
  return array.flatMap(([item, quantity]) => Array(quantity).fill(item));
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]