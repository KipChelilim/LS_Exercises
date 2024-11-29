/*
time 1213 - 1259 46min

Problem
  input: two arrays containing integers
  output: integer count of array 1 meeting criteria
  rule:
    - accept array `appetite`
      - array contains integer values representing appetite level of a pet
      - array can be unsorted
      ? array should contain all integer values as number types
      ? array will not be empty
    - accept an array `treats`
      - array contains integer values representing treat size
      - array can be unsorted
      ? array will contain all integer values as number types
      ? array will not be empty
    - number values in appetite represent required treat size for a pet to be satisfied
    - if a treat is greater than or equal to appetite level, the pet is satisfied
    - once a treat is used, it cannot be reused for another pet
      - e.g appetites of [1, 2, 3] and treats of [3] mean only 1 pet is satisfied, not all pets
    - goal is to maximize the number of satisifed pets
      ? maximizing means determining how many pets in `appetite` have a treat in `treats`
        - without reusing the treats
Example:
  expected inputs: non empty appetites and treats w/ valid integer number types
      - all larger than treats -> given
        [x, x, x] - A
                 [x, x, x] - T
      - some larger than treats -> given
        [x, x, x] - A
           [x, x, x] - T
      - all smaller than or equal to treats  -> given
                  [x, x, x] - A
         [x, x, x] - T
      - some smaller -> given
          [x, x, x] - A
       [x, x, x] - T
      - fewer pets than treats -> given
      - more pets than treats -> given
Data Structures
  copy of treats array, sorted, that i can modify
  counter to track satisifed pets to avoid modifying array while iterating
Algorithm
  initial thoughts
    - sorting treats array, then iterate through appetites
    - need to sort both to efficiently allocate largest treats for largest appetite
    - once appetite is met, can remove a treat
    - so sorted array and iteration down from end of `appetites`
  main program
    - sort copies of both arrays
    - pointer for largest treat
    - pointer for current unsatisfied pet
    - if pet is satified by the largest treat
      - increment treats
    - increment pets

    return counter
  helpers
*/

function assignTreats(appetites, treats) {
  const descendingSort = (a, b) => b - a;

  let sortedAppetites = appetites.slice().sort(descendingSort);
  let sortedTreats = treats.slice().sort(descendingSort);
  let currPetIdx = 0;
  let currTreatIdx = 0;
  let satisfiedPets = 0;

  while (currPetIdx < sortedAppetites.length && currTreatIdx < sortedTreats.length) {
    let currPetAppetite = sortedAppetites[currPetIdx];
    let currTreat = sortedTreats[currTreatIdx];

    if (currTreat >= currPetAppetite) {
      satisfiedPets += 1;
      currTreatIdx += 1;
    }

    currPetIdx += 1;
  }

  return satisfiedPets;
}

console.log(assignTreats([3, 4, 2], [1, 2, 3]) === 2);
console.log(assignTreats([1, 5], [5, 5, 6]) === 2);
console.log(assignTreats([1, 2, 3], [3]) === 1);
console.log(assignTreats([2], [1, 2, 1, 1]) === 1);
console.log(assignTreats([4, 3, 1], [2, 1, 3]) === 2);
console.log(assignTreats([1,2,3], [1,2,3]) === 3);
console.log(assignTreats([4, 5, 6], [1,2,3]) === 0);