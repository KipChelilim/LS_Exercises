function myBind(func, context) {
  return function(...args) {
    func.apply(context, args);
  };
}

const reeseBobby = {
  first: 'if you ain\'t first',
  last: 'you\'re last',
}

let testFunction = function(msg1, msg2) {
  console.log(`${msg1}`);
  console.log(`   ${this.first}`);
  console.log(`   ${this.last}`);
  console.log(`${msg2}`);
}

let message = myBind(testFunction, reeseBobby);
message('start', 'end')