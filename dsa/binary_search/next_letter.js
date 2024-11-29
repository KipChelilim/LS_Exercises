/*
time: 1256 - 119

Problem
  input: array of lowercase letters sorted ascending
  output: letter
  rules:
    accept an array `chars`
      ? will it ever be empty?
      ? will it always have lowercase strings for every element?
      ? will it ever be missing?
      ? will it ever be sparse?
      - lowercase letters
      - can be duplicates
      -
    accept a letter `key`
      ? will it ever be missing?
      ? will it ever be a non-string?
      ? will it ever have more than one char?
      ? will it always be a letter?
    find the smallest letter that is larger than they key
    if no key is is found, return the first char of `chars`
Examples:
  expected inputs: proper letters, no missing or empty values
    - no match, key is 'largest' element -> added
    - match, key is a -> given
    - duplicates -> given
  malformed inputs
  missing
  extra
  other edge cases
Data structure
  no additional structures, same array
Algorithm
  initialize start
  initialize end
  while start < end
    initialize mid point to floor(start + end / 2)
    if midpoint === target
      return true
    if start is < target
      start = midpoint + 1
    else
      end = midpoint - 1
    end

  return false
*/

function findNextLetter(chars, target) {
  let start = 0;
  let end = chars.length - 1;

  while (start < end) {
    let midpoint = Math.floor((start + end) / 2);
    if (chars[midpoint] > target) {
      end = midpoint;
    } else {
      start = midpoint + 1;
    }
  }

  return chars[end] > target ? chars[end] : chars[0];
}

console.log(findNextLetter(['b', 'd', 'f'], 'a') === 'b');
console.log(findNextLetter(['b', 'd', 'f'], 'c') === 'd');
console.log(findNextLetter(['b', 'd', 'f'], 'f') === 'b');
console.log(findNextLetter(['a', 'a', 'b', 'c'], 'a') === 'b');
console.log(findNextLetter(['c', 'f', 'j'], 'c') === 'f');
console.log(findNextLetter(['a', 'c', 'f', 'h', 'i', 'j'], 'g') === 'h');
console.log(findNextLetter(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'], 'k') === 'a');
// All test cases should log true.