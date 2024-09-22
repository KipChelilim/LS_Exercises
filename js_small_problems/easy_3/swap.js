const letterSwap = function firstAndLastLetterSwap(word) {
  let chars = word.split('');
  let lastIndex = chars.length - 1;

  [chars[0], chars[lastIndex]] = [chars[lastIndex], chars[0]];

  return chars.join('');
}

const swap = function swapLettersForEachWord(string) {
  let letterSwappedWords = string.split(' ').map(word => letterSwap(word));
  return letterSwappedWords.join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"