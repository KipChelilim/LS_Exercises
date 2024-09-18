const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;
const MILLISECONDS_PER_MINUTE = 60000;

function afterMidnight(timeStr) {
  let midnight = new Date('01/01/2000 00:00');
  let currentTime = new Date(`01/01/2000 ${timeStr}`);
  deltaMinutes = currentTime.getTime() - midnight.getTime();

  return deltaMinutes / MILLISECONDS_PER_MINUTE;
}

function beforeMidnight(timeStr) {
  let deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr)
  return deltaMinutes === MINUTES_PER_DAY ? 0 : deltaMinutes

}

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686