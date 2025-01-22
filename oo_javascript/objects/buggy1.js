// The morning and name properties within each case were missing `this` which is needed to access
// the properties of the instance object.

// Further exploration: This also works because name is passed into the function when each object is
// instantiated. Because the function variable `name` (not the object property) becomes part of the
// closure for the object factory, the relevant version of `name` is used in the context of `greet`
// for each object.

function createGreeter(name) {
  return {
    name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet(timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += `${this.morning} ${this.name}`;
          break;
        case 'afternoon':
          msg += `${this.afternoon} ${this.name}`;
          break;
        case 'evening':
          msg += `${this.evening} ${this.name}`;
          break;
      }

      console.log(msg);
    },
  };
}

const helloVictor = createGreeter('Victor');
helloVictor.greet('morning');