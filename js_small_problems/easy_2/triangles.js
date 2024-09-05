function triangle(stars) {
  for (let count = 1; count <= stars; count += 1) {
    console.log('*'.repeat(count, '*').padStart(stars));
  }
}

triangle(5);
triangle(9);
