const isPalindrome = function isCaseSensitivePalindrome(string) {
  return string === string.split('').reverse().join('');
}

const isRealPalindrome = function isCaseInsensitiveAlphanumPalindrome(string) {
  let formattedString = string.toLowerCase().match(/[0-9A-Za-z]/g).join('');
  return isPalindrome(formattedString);
}

console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false