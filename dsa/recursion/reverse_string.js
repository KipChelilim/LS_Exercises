/*
time: 110 - 124
takeaways:

Problem
  input: string
  output: string, reversed
  rules
    accept a string
      - string can be empty
      - string can be of any length
      - string can have any characters
    reverse the string
    use recursion
Examples
  expected inputs: -> all given
  malformed: n/a
  missing: n/a
  extra: n/a
  other edge cases: n/a
Data Structures:
  string
Algorithm
  thoughts
    ..... call + call + call + call + call
slice                           he     h
return                           e     h

  main program:
    if string is size 1 return h

*/

function reverseString(str) {
  if (str.length <= 1) return str;
  return str.slice(-1) + reverseString(str.slice(0, -1))
}

console.log(reverseString("hello") === "olleh");
console.log(reverseString("world") === "dlrow");
console.log(reverseString("a") === "a");
console.log(reverseString("") === "");
console.log(reverseString("recursion") === "noisrucer");

// All test cases should log true.