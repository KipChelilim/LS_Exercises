const rlSync = require('readline-sync');

let currentAge = rlSync.question('What is your age? ');
let retirementAge = rlSync.question('At what age would you like to retire? ');

let yearsToRetire = parseInt(retirementAge, 10) - parseInt(currentAge, 10);
let currentYear = new Date().getFullYear()
let retirementYear = currentYear + yearsToRetire

console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${yearsToRetire} years of work to go!`);