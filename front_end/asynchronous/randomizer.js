function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbacks) {
  let sec = 0;
  const id = setInterval(() => {
    console.log(sec += 1);
    if (sec === callbacks.length * 2) clearInterval(id);
  }, 1000);

  callbacks.forEach((callback) => {
    const randomTime = Math.floor(Math.random() * callbacks.length * 2);
    setTimeout(callback, randomTime * 1000);
  });
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6