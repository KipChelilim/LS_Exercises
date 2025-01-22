function makeGreeter() {
  const name = 'Naveed';
  const greeting = 'Hello';

  return {
    message: `${greeting} ${name}!`,
    sayGreetings() {
      console.log(this.message);
    }
  };
}