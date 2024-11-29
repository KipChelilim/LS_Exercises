/*
start 12:50
time 1:28
takeaways
  stop over optimizing
  start small and work your way through
  ALGORITHM AND EXAMPLES
  TEST EARLY AND OFTEN

Problem
  input: string containing numbers represented as words
    e.g. 0 == 'zero'
  output: string with 'number words' converted to digits
  rules:
    accept a string containing number words
    convert the number words to digits
    retain other characters unmodified
    if a number word has punctuation, replace the number word but keep punctuation
      e.g. example with five and four. -> example with 5 and 4.
  questions:
    - assume all other characters should not be modified?
    - are there other chars that could be considered part of a digit? (e.g. `-` sign)
    - in the example we maintain spaces, should that always be the case? or should we ever combine
      the digits?
    - should all chars attached to a number word be kept?
    - will each number word be separated by a space? can they ever be contiguous
Examples
  expected inputs:
    one or more number words
    zero number words?
    number with punctuation
  malformed inputs:
    nonstring input?
    another object containing the string?
  missing
  extra
  other edge cases
Data Structure
  array of words for transformation
  const array mapping word chars to corresponding index positions
  regex to match only the word if there's punctuation
Algorithm
  initialize const of numberWords as array
  split string into words
  transform words:
    get wordOnlyChars (to ignore puncutation)
    if wordOnlyChars is a number word
      get index of word
      return replacement
    if not, return original word
  return joined string with spaces
*/

function wordToDigit(string) {
  const numberWords = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  let words = string.split(' ');

  let updatedString = words.map((orgWord) => {
    let regex = /[a-z]+/i;
    let wordCharsOnly = orgWord.toLowerCase().match(regex)[0];

    if (numberWords.includes(wordCharsOnly)) {
      return orgWord.replace(regex, numberWords.indexOf(wordCharsOnly));
    } else {
      return orgWord;
    }
  });

  return updatedString.join(' ');
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// // "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('Please call me at my number. Thanks.'));

console.log(wordToDigit('Please call me at my number at One.'));
