const leadingSubstrings = (string)  => {
    return Array.from(string, (_, idx) => string.substring(0, idx + 1));
}

const substrings = (string) => {
  return Array.from(string).flatMap((_, idx) => leadingSubstrings(string.substring(idx)));
}

const palindromes = (string) => {
  let substringsArray = substrings(string);
  return substringsArray.filter(isPalindromic);
}

const isPalindromic = (string) => {
  if (string.length < 2) return false;

  let limit = Math.trunc(string.length / 2)
  for (let idx = 0; idx < limit; idx += 1) {
    let oppositeIndex = string.length - idx - 1
    if (string[idx] !== string[oppositeIndex]) return false;
  }

  return true;
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]