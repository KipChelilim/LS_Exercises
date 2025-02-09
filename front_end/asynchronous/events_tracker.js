class Tracker {
  constructor() {
    this.events = new Set();
  }

  add(event) {
    return this.events.add(event);
  }

  list() {
    return Array.from(this.events);
  }

  elements() {
    return this.list().map((event) => event.target);
  }

  clear() {
    this.events.clear();
    return this.events.size;
  }
}

let tracker = new Tracker();
function track(callback) {
  return function(event) {
    tracker.add(event);
    callback(event);
  }
}


document.addEventListener('DOMContentLoaded', (event) => {
  const divRed = document.querySelector('#red');
  const divBlue = document.querySelector('#blue');
  const divOrange = document.querySelector('#orange');
  const divGreen = document.querySelector('#green');

  divRed.addEventListener('click', track(event => {
    document.body.style.background = 'red';
  }));

  divBlue.addEventListener('click', track(event => {
    event.stopPropagation();
    document.body.style.background = 'blue';
  }));

  divOrange.addEventListener('click', track(event => {
    document.body.style.background = 'orange';
  }));

  divGreen.addEventListener('click', track(event => {
    document.body.style.background = 'green';
  }));
});