/*
start: 604
end: 6:52
takeaways
  - need more focus on the problem
  - mind always wanders to how to solve specific problems
    - i think of a use case and instantly how i can start addressing it

Problem:
  input: string of plaintext, and a keyword for the shift values
  output: encrypted string
  rules:
    accept a string to encrypt
    accept a keyword to determine shift values in a vignere cipher
    the vignere cipher is a series of caesar ciphers where:
      each letter of the keyword is treated as a shift value
      shift values are zero based indexes where a === 0, b === 1, etc
      case does not matter
      cipher is applied sequentially using the current shift value
        each letter of the keyword is mapped to a letter in the plaintex
          e.g. Pineapple - Pine appl
                          meat meat
        you move through the keyword with each move through the plaintext
        loop to the start of the keyword when you reach the end but have more chars to encrypt

  questions:
    what if my keyword contains non alphabetic characters? assume it won't
    if my keyword is larger than the plaintext, does that change processing? no
      (e.g. loop to start of plaintext)
    if my keyword is smaller than plaintext, does that change anything? no change, keep looping
    can my keyword ever be emtpy? assume no
    can my plaintext ever be empty? assume no
    will my keyword ever be missing? assume no
    can keyword or plaintext every be a non-string? assume no
    if there are no letters to encrypt should i still return the plaintext string? no
    can plaintext ever be missing or nonstring? no
    extra inputs? ignore
Examples:
  keyword:
    expected input: all alphabetic characters
      1 letter
      less letters than plaintext (given)
      more letters than plaintext
  plaintext:
    expected input: string with any character type at least 1 alphabetic
      1 letter
      less letters than keyword
      more letters than keyword (given)
      non alphabetic characters (given)
    malformed input:
      only non-alphabetic characters
      empty string
    missing plaintext
    wrong data type
  extra inputs:
  other edge cases:
Data Structure:
  input: strings
  output: string
  processing:
    array of indexes using keyword to get shift values
    copy of that array during iteration to shift values
Algorithm
  split keyword into an array of characters
  transform keyword chars into index values
    map, and return codepoint minus base
  create a copy of the shift values
  if the shift values are empty, get a new copy
  remove the first value from the shift values and use it to call the caesar cipher
  return the result
*/

const preAlphaCodePoint = { upper: 64, lower: 96, }
const ALPHABET_COUNT = 26

function vigenereEncrypt(plaintext, keyword) {
  let shiftValues = keyword.toLowerCase().split('').map((letter) => {
    return letter.charCodeAt(0) - preAlphaCodePoint.lower - 1;
  });

  let chars = plaintext.split('');
  let currentShiftValues = shiftValues.slice(0);

  let encryptedChars = chars.map((char) => {
    if (currentShiftValues.length === 0) currentShiftValues = shiftValues.slice(0);
    if (/[a-z]/i.test(char)) {
      return shiftedLetter(char, currentShiftValues.shift());
    } else {
      return char;
    }
  });

  return encryptedChars.join('');
}

function shiftedLetter(letter, shiftValue) {
  let letterCodePoint = letter.charCodeAt(0);
  let alphaStart = (letterCodePoint > preAlphaCodePoint.lower) ? preAlphaCodePoint.lower : preAlphaCodePoint.upper

  let letterPosition = letterCodePoint - alphaStart;
  let newLetterCodePoint = (letterPosition + shiftValue);
  if (newLetterCodePoint > 26) newLetterCodePoint %= ALPHABET_COUNT;

  return String.fromCharCode(newLetterCodePoint + alphaStart);
}

// keyword has less letters than plaintext (given)
// plaintext has more letters than keyword (given)
// plaintext has non alphabetic characters (given)
// console.log(vigenereEncrypt('Pineapples don\'t go on pizzas!', 'meat'));

// // keyword with less letters
// // plaintext with more letters
console.log(vigenereEncrypt('as', 'meat'));

// // one letter keyword
console.log(vigenereEncrypt('Pineapples don\'t go on pizzas!', 'a'));
console.log(vigenereEncrypt('Pineapples don\'t go on pizzas!', 'b'));
