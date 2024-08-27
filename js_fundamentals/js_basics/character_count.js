let rlSync = require('readline-sync');
let phrase = rlSync.question('Please enter a phrase: ');

console.log(`There are ${phrase.length} characters in "${phrase}".`);
