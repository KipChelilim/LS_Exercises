/*
start 925
end 1021
takeaways

Problem
  input:
    plain text to encrypt
    cipher key as an integer representing the shift value
  output:
    cypher text
  rules:
    cipher rules:
      an integer represents a shift value
      the shift value indicates the number of letters after the current letter to shift to
        e.g. A with a shift value becomes D
      the shift value, once it reaches the end of the alphabet, just wraps around
        e.g. y, 5 becomes d
      the cipher is only applied to letters
      all other characters are left unchanged
      encrypted letters should maintain their case
    accept a string as the first argument representing text to encrypt 'plaintext'
    accept a number as the second argument represending the shiftValue
    return the encrypted version of the plaintext
  questions
    shiftValue
      - can it ever be negative? should i left shift if negative?
      - will it ever be zero? does 0 mean no change?
    plaintext
      - will it always be a string?
      - can it every be an empty string?
Examples
  expected inputs:
    simple shift
    wrap around
    all letters
    multiple cases
    non-letters
  malformed inputs:
    plaintext
      empty string?
    shiftValue
      negative?
      zero?
      number as a string type?
      non-integer value?
  missing inputs?
  extra inputs?
  invalid types?
  other special cases
Data Structure
  input: string, integer
  processing:
    array of characters
  output: string
Algorithm
  main program
    split string into array of characters
    transform each character
      if character matches regex of a letter, return shifted letter
      otherwise, return character
    join transformed array
    return joined string
  shiftedLetter
    get code point for letter
    get preletter code point
      if character is uppercase, use uppercase preletter code point
      otherwise use lowercase preletter code point
    subtract pre letter code point to get letter position
    add shift key to letter position and get % 26
    add resulting remainder to preletter codepoint
    return character at codepoint
*/

function caesarEncrypt(plaintext, shiftValue) {
  let chars = plaintext.split('');
  let encryptedChars = chars.map((char) => {
    if (/[a-z]/i.test(char)) {
      return shiftedLetter(char, shiftValue);
    } else {
      return char;
    }
  });

  return encryptedChars.join('');
}

function shiftedLetter(letter, shiftValue) {
  const preAlphaCodePoint = { upper: 64, lower: 96, }
  const ALPHABET_COUNT = 26
  let letterCodePoint = letter.charCodeAt(0);
  let alphaStart = (letterCodePoint > preAlphaCodePoint.lower) ? preAlphaCodePoint.lower : preAlphaCodePoint.upper

  let letterPosition = letterCodePoint - alphaStart;
  let newLetterCodePoint = (letterPosition + shiftValue);
  if (newLetterCodePoint > 26) newLetterCodePoint %= ALPHABET_COUNT;

  return String.fromCharCode(newLetterCodePoint + alphaStart);
}

// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"

// multiple cases
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// multiple cases
console.log(caesarEncrypt('AaAaA', 3));       // "D"
// DdDdD

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

console.log(caesarEncrypt('??????', 3));       // "??????"