const rlSync = require('readline-sync');

const numberSuffix = function formatNumberSuffix(num) {
  switch(num) {
  case 1:
    return 'st';
    break;
  case 2:
    return 'nd';
    break;
  case 3:
    return 'rd';
    break;
  default:
    return 'th'
  }
}

const askForNumbers = function getUserNumbers() {
  let numbers = [];

  for (let count = 1; numbers.length < 6; count += 1) {
    let nthNum = count === 6 ? 'last' : String(count) + numberSuffix(count);

    let input = rlSync.question(`Enter the ${nthNum} number: `);
    numbers.push(parseInt(input, 10));
  }

  return numbers;
}

let firstFive = askForNumbers();
let lastNumber = firstFive.pop();
let appearsOrNot = firstFive.includes(lastNumber) ? 'appears' : 'does not appear';

console.log(`\nThe number ${lastNumber} ${appearsOrNot} in [${firstFive.join(', ')}].`);