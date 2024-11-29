const letterCaseCount = function getCountOfLetterCases(string) {
  let caseCounts = { lowercase: 0, uppercase: 0, neither: 0, }
  let characters = string.split('');

  characters.forEach((char) => {
    if (/[^a-z]/i.test(char)) {
      caseCounts.neither += 1
    } else if (char.toUpperCase() === char) {
      caseCounts.uppercase += 1
    } else {
      caseCounts.lowercase += 1
    }
  });

  return caseCounts;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }