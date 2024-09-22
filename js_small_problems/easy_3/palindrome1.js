const isPalindrome = function isCaseSensitivePalindrome(string) {
  let chars = string.split('');
  let reverseChars = chars.slice().reverse();

  return !chars.some((char, idx) => char !== reverseChars[idx]);
}

console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true