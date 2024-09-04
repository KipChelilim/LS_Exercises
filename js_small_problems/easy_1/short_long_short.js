function shortLongShort(firstString, secondString) {
  let strings = [firstString, secondString].sort((first, second) => {
    return first.length - second.length;
  });

  return strings[0] + strings[1] + strings[0];
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"