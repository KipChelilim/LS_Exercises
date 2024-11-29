/*
start: 734
end: 8:25
takeaways:
  - simplify the problem
  - focus on the algorithm
  - go slow and make sure you have the mathematical approach down if you go that route
  - dont be afraid to use the overly simple mechanism
  - really build out the problem - its an n x n grid so you could easily see:
    - each row is n characters
    - there are 3 given in non middle rows
    - the remaining characters are spaces split between 4 padding sequences
      - outer padding
      - inner padding
      - inner padding
      - outer padding
    - inner padding can be algorithmically determined: first and last rows have no outside padding
      - meaning outer padding starts as idx and inner padding starts as n - 3  / 2
      - so the algorithm for each is:
        - outer === idx
        - inner === n - 3 / 2 - idx
      - no need to create reverse order star
Problem
  input: odd integer, `n`
  output: `n` x `n` grid of stars
  rules:
    accept an odd integer n
    the smallest n is 7
    return an n x n grid where:
      the middle line contains n stars
      every other line contains 3 stars
      each line moving away from the middle is padded with spaces between stars, where:
        inner padding:
          the first line from middle is padded with zero spaces between each star
          next line moving away is padded with 1 space between each star, etc
        outer padding: enough leading & trailing spaces equal overall length of n
          output should have no trailing spaces, so its x spaces less current distance from middle row
            x is equal to (n / 2).floor - 1
  Q&A:
    is it possible to have a string that represents a number? e.g. "1" -> no
    any values below 7? -> no
    can i assume the value will actually be odd?
    can i assume it will always be a number type?
    how should I handle missing inputs? assume non
    how should I handle extra inputs? ignore
Examples
  expected inputs: single positive, odd integer only input
    -7:
      middle row is 4 with 7 stars
      row 1 has 0 leading spaces, 2 inner spaces for each star
      row 2 has 1 leading space, 1 inner space
      row 3 has 2 leading spaces, 0 inner spaces
      row 4 has 0 leading spaces, 0 inner spaces
    - 9:
      same pattern where middle row has n stars
      row -1 has x spaces, 0 inner spaces (index 0)
        x: (9 / 2).floor - 1 - idx === 4.5.floor - 1 === 4 - 1 === 3
      row -2 has x - idx spaces, idx inner spaces (index 1)
        x: 3 - idx === 3 - 1 === 2
      row -3....
  missing inputs?
  extra inputs?
  other edge cases?
Data Structure
  input: integer
  output: string
  processing:
    array of each row of stars
    string for middle row
    subarrays joined back to strings:
      3 stars, padded
Algorithm
  main program:
    initialize `paddedRowsCount` to (n / 2) - 1 truncated
    initialize array with `***` values, length === # of padded rows
    for each row fill with `paddedRow`
    initialize `middleRow` to n stars as string
    log paddedRow joined by new line character
    log middleRow
    log reverse paddedRow joined by newline character
  helpers:
    paddedRow(outsideRows, leadingSpaces)
      transform each row:
        padding = y spaces, where y === idx
        leadingSpaces + star + padding + star + padding + star
*/

function star(rows) {
  let paddedRowsCount = Math.floor(rows / 2);
  let leadingSpacesCount = paddedRowsCount - 1;

  let outsideRows = Array(paddedRowsCount).fill(null).map((row, idx) => {
    return paddedStars(row, idx, leadingSpacesCount);
  });

  let middleRow = '*'.repeat(rows);

  console.log(outsideRows.reverse().join('\n'));
  console.log(middleRow);
  console.log(outsideRows.reverse().join('\n'));
}

function paddedStars(_, idx, frontPaddingCount) {
  let innerPadding = ' '.repeat(idx);
  let leadingSpaces = ' '.repeat(frontPaddingCount - idx);
  return leadingSpaces + '*' + innerPadding + '*' + innerPadding + '*';
}

star(7);
// logs
// *  *  *
// * * *
//   ***
// *******
//   ***
// * * *
// *  *  *

star(9);
// logs
// *   *   *
// *  *  *
//   * * *
//   ***
// *********
//   ***
//   * * *
// *  *  *
// *   *   *
