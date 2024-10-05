/*
  Requirement
    get all substrings from a string argument
    input: string argument
    output: array of every substring starting with first letter (leading)
  algorithm
    - for each index
      - get leading substring up to end of slice
*/

const leadingSubstrings = (string)  => {
    return Array.from(string, (_, idx) => string.substring(0, idx + 1));
}

const substrings = (string) => {
  return Array.from(string).flatMap((_, idx) => leadingSubstrings(string.substring(idx)));
}




console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]