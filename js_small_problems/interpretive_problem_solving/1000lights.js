/*
start: 604
end: 6:51
takeaways:
  - caught up in the proof,
  - not enough time in the examples and getting to a workable solution
  - distracted with solutions while trying to come up with questions
  - going through the motions on questions instead of thinking about what helps me  
*/

/*
Problem
  input: number identifying number of lights
  output: array of lights that are "on"
  rules:
    - accept an argument specifying the number of light switches
    - the argument also identifies the number of times to go through lights and toggle
    - for each pass, toggle every n lights, where n is the current pass through
      - example, for 3 lights:
        - first pass: toggle every 1 light starting with the first
        - second pass: toggle every 2nd light starting with the second
        - third pass: toggle eveyr 3rd light starting with the third
    - each light starts as 'off', each toggle goes from off to on
  questions
    inputs:
      - expected input: will it always be a number type integer greater than 0?
      - missing / extra inputs: should i expect missing inputs? how should i handle?
      - malformed inputs:
        - should i expect non Number types representing numbers (e.g. string '1')?
        - should i control for non numbers as input?
        - can there every be 0 or negative as an input? how should i handle?
      - extra inputs: can there be extra inputs?
      - others:
        - should i assume 1000 is the limit for number of lights?
    outputs:
      - should i always
Examples
  - good input:
    - even integer
    - odd integer
    - zero
  - malformed input:
Data Structure
  - input: integer
  - processing:
    - array of multiples
    - array of numbers 1 through n
  - output
Algorithm
  main program:
    - get array of numbers from 1 - n
      - [ 1, 2, 3, 4, 5]
      - [ 1, 2, 3, 4, 5, 6, 7, 8]
    - filter numbers for ones that have odd number of multiples from 1 - curr num
    - return filtered array
  filter callback function:
    - if multiplesOf % 2 !== 0
        1 -> true -> on
        2 -> false -> off
        3 -> true -> off
        4 -> false -> on
        5 -> false -> off
        6 -> false -> off
        7 -> false -> off
        8 -> false -> off
  multiplesOf
    - for each num from 1 to n
      - if n % eachNum === 0, push to result array
        1 -> [1]
        2 -> [1, 2]
        3 -> [1, 3]
        4 -> [1, 2, 4]
        5 -> [1, 5]
        6 -> [1, 2, 3, 6]
        7 -> [1, 7]
        8 -> [1, 2, 4, 8]
    - return result
Algorithm 2:
  build array of numbers 1 - sqrt of n truncated
  transform numbers into squared versions
  return squared verions
*/

function lightsOn(switches) {
  let limit = Math.trunc(Math.sqrt(switches));

  let initialNums = Array.from({ length: limit }, (_, idx) => (idx + 1) ** 2);
  console.log(initialNums);
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
lightsOn(6);
lightsOn(7);
lightsOn(8);
lightsOn(9);
lightsOn(10);
lightsOn(11);
lightsOn(12);
lightsOn(13);
lightsOn(14);
lightsOn(15);
lightsOn(16);