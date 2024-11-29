/*
start 249 - 329
time 40
takeaways
  fluency - had to make a less than elegant solution for precision when there's toFixed

Problem
  - input: string
  - output: object with:
    - lowercase, uppercase, and neither properties
    - properties are assigned to ratio of chars that match each
      - ratios should be precision 2 format and strings
  - rules:
    - accept a string containing alphabetic and non alphabetic characters
      - the string wil contain at least one character
      - the character is not guaranteed to be alphabetic
    - calculate percentage of characters that are uppercase, lowercase, or neither
      - neither characters can include spaces, numbers, anything that is not an alphbetic character
    - return an object containing the percentage of total characters that match each category
      - percentages should be of precision 2 anad returned as strings
  - questions:
    - should i assume anything that is not [a-z] or [A-Z] is neither? -> yes
    - am i correct that spaces should be counted? -> yes
    - should i assume input will always be a single string? -> yes
    - should the output always be precision 2 as shown? -> yes
    - how should missing input be handled? -> no new test case
    - how should extra inputs be handled? -> ignore
    - can the input ever be another data type? -> no
    - how should i round values? truncate, round to nearest?
Examples
  expected inputs:
    mix of characters -> given
    all upper case -> new test case
    all lower case -> new test case
    all neither -> given
  malformed inputs: n/a
  missing: n/a
  extra: n/a
  other processing/cases:
    ratio is naturally less than 2 -> given
    ratio is naturally more than precision 2 -> new test case
Data Structure
  - regex to extract matching chars and count them
  - string for final percentages
  - object to store results
Algorithm
  main program
    - initialize object to store percentages - y
    - initialize array of regex expressions to test for each char
    - transform the array to get counts from regex
      - get matches or []
      - return String(formatPrecisionTwo(length / string length * 100))
    - assign array values to percentages object
    - return object
  formatPrecisionTwo
    multiple value by 100
    round to nearest integer
    return number divided by 100
*/

function letterPercentages(string) {
  let percentages = { lowercase: null, uppercase: null, neither: null, };
  const regexPatterns = [/[a-z]/g, /[A-Z]/g, /[^a-z]/gi]

  let casePercentages = regexPatterns.map((regex) => {
    let patternMatches = string.match(regex) || []
    return (patternMatches.length / string.length * 100).toFixed(2);
  });

  percentages.lowercase = casePercentages[0];
  percentages.uppercase = casePercentages[1];
  percentages.neither = casePercentages[2];

  return percentages;
}

// mix of characters
// ratio is naturally less than 2
console.log(letterPercentages('abCdef 123')); // { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }
console.log(letterPercentages('AbCd +Ef')); // { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

// all uppercase
console.log(letterPercentages('ABC')); // { lowercase: "0.00", uppercase: "100.00", neither: "0.00" }

// all lowercase
console.log(letterPercentages('abc')); // { lowercase: "100.00", uppercase: "0.00", neither: "0.00" }

// all neither
console.log(letterPercentages('123')); // { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

// ratio greater than 2 naturally
console.log(letterPercentages('a1234567890')); // { lowercase: "9.09", uppercase: "0.00", neither: "90.91" }