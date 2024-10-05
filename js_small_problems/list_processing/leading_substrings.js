/*
  Requirement
    get all substrings from a string argument
    input: string argument
    output: array of every substring starting with first letter (leading)
*/

const leadingSubstrings = (string)  => {
  const runningSubstring = (_, idx) => string.substring(0, idx + 1);
  return Array.from(string, runningSubstring);
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]