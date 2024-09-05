function crunch(string) {
  if (string.length < 2) return string;

  let crunchedString = string[0];

  for (let index = 1; index < string.length; index += 1) {
    if (string[index] === string[index - 1]) continue;
    crunchedString += string[index];
  }

  return crunchedString;
}


console.log(crunch('ddaaiillyy ddoouubbllee') === "daily double")
console.log(crunch('4444abcabccba') === "4abcabcba")
console.log(crunch('ggggggggggggggg') === "g")
console.log(crunch('a') === "a")
console.log(crunch('') === "")