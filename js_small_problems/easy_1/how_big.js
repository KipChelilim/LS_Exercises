let rlSync = require('readline-sync');

let lengthMeters = parseInt(rlSync.prompt({
  prompt: 'Enter the length of the room in meters:\n'
}), 10);

let widthMeters = parseInt(rlSync.prompt({
  prompt: 'Enter the width of the room in meters:\n'
}), 10);

const SQ_METER_TO_FEET = 10.7639;
let areaMeters = (lengthMeters * widthMeters).toFixed(2);
let areaFeet = (areaMeters * SQ_METER_TO_FEET).toFixed(2);

console.log(
  `The area of the room is ${areaMeters} meters (${areaFeet} square feet).`;
);

