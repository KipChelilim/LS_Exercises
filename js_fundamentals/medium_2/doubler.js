const makeDoubler = function doublerMaker(caller) {
  return number => {
    console.log(`This function was called by ${caller}.`);
    return number + number;
  };
}

const doubler = makeDoubler('Victor');
doubler(5);                             // returns 10
// logs:
// This function was called by Victor.