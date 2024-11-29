const staggeredCase = function swapCaseEveryLetter(string) {
  let characters = string.split('');
  let capsLock = false;

  return characters.map((char, idx) => {
    if (/[a-z]/i.test(char)) {
      capsLock = !capsLock;
      return capsLock ? char.toUpperCase() : char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"