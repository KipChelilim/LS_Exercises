/*
start: 803
finish: 846
takeaways:
  dont get sucked into rabbit holes
  simple error with commented out funciton call led me down rabbit hole of hoisting
  it wasnt hoisting -_-

Problem
  input: string
  output: boolean
  rules:
    spelling blocks have 2 letters per block
    a valid word cannot:
      include both letters from a block
        only use a block once
      include a block more than once
        no duplicate letters
    accept a word string and test if the word is valid
    perform the test case insensitive
  blocks:
    B:O
    X:K
    D:Q
    C:P
    N:A
    G:T
    R:E
    F:S
    J:W
    H:U
    V:I
    L:Y
    Z:M
  questions
    assume input will always be a string?
    should i plan for empty strings? how should they be handled? none
    should i plan for nonalphabetic characters? how should they be handled? none
    should i plan for other data types containing the string? no
Examples
  expected inputs:
    valid words
      batch - > valid, B:O, N:A, G:T, C:P, H:U
      jest -> valid J:W, R:E, F:S, G:T
    invalid: use both letters of a block
      butch -> invalid, B:O, H:U.... reused for the H
      gate -> invalid because G and T share a block
    invalid: duplicate letters
      gag -> invalid because g was duplicated
    case sensitive valid
      jEsT
    case insensitive valid
      BaTcH -> valid
  malformed inputs:
    empty strings?
    numbers or non alphabetic chars in string?
    multiple words?
  missing args
  extra args
  invalid type?
    array or object containing words?
  other special cases?
Data Structure
  input: string
  intermediate:
    regex for each block in an array
  output: boolean
Algorithm
  create my array for spellingBlocks
  initialize `result` as true
  for each spelling block
    - get match of regex for the block
    - if there is more than 1 match, set result to false
  return result
*/
const spellingBlocks = [
  /(b|o)/gi,
  /(x|k)/gi,
  /(d|q)/gi,
  /(c|p)/gi,
  /(n|a)/gi,
  /(g|t)/gi,
  /(r|e)/gi,
  /(f|s)/gi,
  /(j|w)/gi,
  /(h|u)/gi,
  /(v|i)/gi,
  /(l|y)/gi,
  /(z|m)/gi,
]

function isBlockWord(str) {
  let result = true;
  spellingBlocks.forEach((block) => {
    let matches = str.match(block) || 0;
    if (matches.length > 1) result = false;
  });

  return result;
}

console.log(isBlockWord('BATCH') === true);
console.log(isBlockWord('jest') === true);
console.log(isBlockWord('BUTCH') === false);
console.log(isBlockWord('gate') === false);
console.log(isBlockWord('gag') === false);
console.log(isBlockWord('jEsT') === true);
console.log(isBlockWord('BaTcH') === true);