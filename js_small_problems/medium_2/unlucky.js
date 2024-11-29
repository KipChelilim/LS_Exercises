/*
start 11:28 - 1215
time
takeaways:
  need more Date object proficiency, not worth manual date increment function
  dont time tracking includes lookups to date functionality and testing incrementing dates
  nope, time track. there was a much simpler solution
  simplify the problem, think through multiple approaches
  think through the domain and redefine the output in more than one way before going to solution
    e.g. only one 13th each month, limited number of months
      do need to use date object
      do not need mathematical way to calc it
      limited population size and easy to construct population to iterate over

Problem
  input: number representing a year
  output: integer value representing number of fridays with date 13
  rules:
    assume year is a gregorian cal year, greater than 1752
    assume all future years will be on the same calendar
  questions:
    will the input always be an integer, number type?
    how should i handle missing inputs
    how should i handle extra inputs
    a friday the 13th is any date with a day of Fri and a date of 13?
  summary:
    accept an integer number type greater than 1752
    identify the number of dates in that year which:
      are on a Friday
      have a month date of 13
Examples
  expected inputs: given, no new test cases
Data Structure
  date object to extract days and dates
Algorithm
  main program
    convert year into date on Jan 1
    iterate through all days in the year
    if date is both a 13th and a Friday, increase counter
    return counter
  helpers:
    advanceDate():
      initialize new date as current date
      set its time as + 86400000
      return new date
    get first friday()
      find current day
      find difference between current day and friday (5)
      set date to next day
*/

function fridayThe13ths(year) {
  let firstDayOfYear = new Date(`1/1/${year}`);
  let currentFriday = firstFridayAfterDate(firstDayOfYear);
  let count = 0;

  while (currentFriday.getFullYear() === year) {
    if (currentFriday.getDay() === 5 && currentFriday.getDate() === 13) count += 1;
    currentFriday = advanceNDays(currentFriday, 7);
  }

  return count;
}

function advanceNDays(date, numOfDays = 1) {
  let tomorrow = new Date(date);
  tomorrow.setTime(date.getTime() + 86400000 * numOfDays);
  return tomorrow;
}

function firstFridayAfterDate(date) {
  let currentDay = new Date(date);
  let daysToFirstFriday = 5 - currentDay.getDay();
  return advanceNDays(currentDay, daysToFirstFriday);
}

console.log(fridayThe13ths(1986) === 1);
console.log(fridayThe13ths(2015) === 3);
console.log(fridayThe13ths(2017) === 2);