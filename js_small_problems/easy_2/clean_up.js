function cleanUp(string) {
  let cleanString = '';
  for (let index = 0; index < string.length; index += 1) {
    if (string[index].match(/[A-z]/)) {
      cleanString += string[index]
    } else (cleanString[cleanString.length - 1] !== ' ') {
      cleanString += ' ';
    }
  }

  return cleanString;
}

console.log(cleanUp("---what's my +*& line?") == " what s my line ")