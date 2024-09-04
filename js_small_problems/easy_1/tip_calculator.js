let rlSync = require('readline-sync');

let bill = parseFloat(rlSync.question('What is the bill? '));
let tipPercent = parseFloat(rlSync.question('What is the tip percentage? '));

let tip = bill * tipPercent / 100;

console.log(`The tip is \$${tip.toFixed(2)}`);
console.log(`The total is \$${(tip + bill).toFixed(2)}`);