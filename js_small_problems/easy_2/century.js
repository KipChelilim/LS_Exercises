function numberSuffix(lastDigitString, lastTwoDigits) {
  if (lastTwoDigits > 10 && lastTwoDigits < 20) return 'th';

  switch(lastDigitString) {
  case '1':
    return 'st';
    break;
  case '2':
    return 'nd';
    break;
  case '3':
    return 'rd';
    break;
  default:
    return 'th'
  }
}

function century(year) {
  let centuryNumber = Math.ceil(year / 100);
  let centuryString = centuryNumber.toString();
  let lastDigitString = centuryString[centuryString.length - 1];
  let lastTwoDigits = parseInt(centuryString.substring(centuryString.length - 2), 10);

  return centuryString + numberSuffix(lastDigitString, lastTwoDigits);
}


// console.log(century(2000));        // "20th"
// console.log(century(2001));        // "21st"
// console.log(century(1965));        // "20th"
// console.log(century(256));         // "3rd"
// console.log(century(5));           // "1st"
// console.log(century(10103));       // "102nd"
// console.log(century(1052));        // "11th"
// console.log(century(1127));        // "12th"
// console.log(century(11201));       // "113th"

console.log(century(2000) === "20th");
console.log(century(2001) === "21st");
console.log(century(1965) === "20th");
console.log(century(256) === "3rd");
console.log(century(5) === "1st");
console.log(century(10103) === "102nd");
console.log(century(1052) === "11th");
console.log(century(1127) === "12th");
console.log(century(11201) === "113th");