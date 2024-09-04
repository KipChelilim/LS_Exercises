let rlSync = require('readline-sync');

let integer = rlSync.question('Please enter an integer greater than 0: ');
integer = parseInt(integer, 10);

let operation = rlSync.question(
  'Enter "s" to compute the sum, or "p" to compute the product. '
);

if (operation === 's') operation = 'sum'
if (operation === 'p') operation = 'product'

function sumOrProduct(num, operation) {
  let sum = 0;
  let product = 1;
  for (let i = 1; i <= num; i += 1) {
    switch (operation) {
      case 'sum':
        sum += i;
        break;
      case 'product':
        product *= i;
        break;
    }
  }

  if (operation === 'sum') return sum;
  if (operation === 'product') return product;
}

let total = sumOrProduct(integer, operation);

console.log(
  `The ${operation} of the integers between 1 and ${integer} is ${total}.`
);