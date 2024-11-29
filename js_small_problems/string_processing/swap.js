const swapCase = function swapUpperAndLowerCases(string) {
  let characters = string.split('');

  return characters.map((char) => {
    return char.toUpperCase() === char ? char.toLowerCase() : char.toUpperCase();
  }).join('');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"