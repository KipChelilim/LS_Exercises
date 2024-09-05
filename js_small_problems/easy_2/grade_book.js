function getGrade(score1, score2, score3) {
  let averageScore = (score1 + score2 + score3) / 3
    if (averageScore >= 90) {
    return 'A';
  } else if (averageScore >= 80) {
    return 'B';
  } else if (averageScore >= 70) {
    return 'C';
  } else if (averageScore >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

console.log(getGrade(95, 90, 93) === "A");
console.log(getGrade(50, 50, 95) === "D");