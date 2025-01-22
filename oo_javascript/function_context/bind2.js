function myBind(func, context, ...boundArgs) {
  return function(...args) {
    return func.apply(context, boundArgs.concat(args));
  };
}

// const reeseBobby = {
//   first: 'if you ain\'t first',
//   last: 'you\'re last',
// }

// // let testFunction = function(msg1, msg2) {
// //   console.log(`${msg1}`);
// //   console.log(`   ${this.first}`);
// //   console.log(`   ${this.last}`);
// //   console.log(`${msg2}`);
// // }

// // let message = myBind(testFunction, reeseBobby, 'start');
// // message('complete')

function addNumbers(a, b) {
  return a + b;
}

const addFive = myBind(addNumbers, null, 5);

console.log(addFive(10)); // 15