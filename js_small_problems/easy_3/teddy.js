const randomAge = function generateRandomAge() {
  const maxAge = 200;
  const minAge = 20;
  let age = Math.floor(Math.random() * (maxAge - minAge + 1) + minAge);

  console.log(`Teddy is ${age} years old!`);
}

randomAge();