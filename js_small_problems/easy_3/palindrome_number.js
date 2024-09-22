const isPalindrome = function isCaseSensitivePalindrome(string) {
  return string === string.split('').reverse().join('');
}

const isPalindromicNumber = function isPalindromicIntegerNumber(integer) {
  let numberString = String(integer)
  return isPalindrome(numberString);
}

console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true