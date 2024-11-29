/*
start 9:54
finish 10:26
takeaways
*/

/*
Problem
  input: odd integer
  output: n x n grid of stars in the shape of a diamond, logged to console
  rules:
    accept an odd integer as input 'n'
    log a grid of size n x n
    place '*' chars in the grid
    first row should have 1 star
    increase the number of stars on each row by 2 until reaching n
    then decrease by 2 until reaching 1
    pad each row with spaces to reach the correct number of characters for each row
  questions
    - should i assume the input will always be a Number type? yes
      - how should i handle non Number types that can be converted to numbers? n/a
    - will the input ever be 0 or negative? how should i handle those cases? possible
    - how should i handle missing or extra inputs? assume not applicable
Examples
  expected inputs:
    number type odd integer
  malformed inputs
    negative value? -1
    zero value? 0
Data Structure
  input: integer
  intermediate:
    string for each row
    array to capture each row of the grid
  output: n/a
Algorithm
  if n is less than 1, return nothing
  initialize a counter to 1
    5
  initialize stars to 1
  initialize rowLength to n
  iterate up to counter
    log stars, padded with rowLength - stars spaces
      n === 5
        stars === 1
        rowLength === 5
        padding === 5-1
        each side gets 2 spaces
    if counter is > ceil(n / 2) stars - 2
    else stars + 2
*/
function diamond(n) {
  if (n < 1) return;

  let stars = 1;
  let rowLength = n;

  for (let counter = 1; counter <= n; counter += 1) {
    let padding = ' '.repeat((rowLength - stars) / 2)
    console.log(padding + '*'.repeat(stars) + padding);

    stars += counter < Math.ceil(n / 2) ? 2 : -2
  }
}


// diamond(-1);
// diamond(0);

// diamond(1);
// // logs
// // *

diamond(3);
// // logs
// // *
// // ***
// // *
diamond(5);
diamond(9);
// // logs
// //     *
// //   ***
// //   *****
// // *******
// // *********
// // *******
// //   *****
// //   ***
// //     *