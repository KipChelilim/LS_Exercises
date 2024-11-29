/*
start 12:00
time 12:35
takeaways

Problem
  input: string containing commands and values
  output: integer
  rules:
    stack and register start as [] and 0 respectively
    accept a string input containing one or more commands or values separated by a single space
    all tokens will be valid commands
    all commands operations are integer operations, which applies to DIV and REMAINDER
      truncate results if non-integers
    operations requiring two values will pop the topmost item from the stack to combine with register
    commands:
      n: when integer value is received, place it in the register. NO STACK MODIFICATIONS
      PUSH: push register value into the stack
      ADD: pop value from stack, add to register, update register
      SUB: pop value           , subtract       , update
      MULT:pop value           , multiply,      , update
      DIV: pop value           , divide & trun  , update
      REMAINDER: pop value,    , get remainder  , update
      POP: pop value,                           , update
      PRINT: print current register value
    assume all arguments are valid
    do not need to control for an empty stack
    all tokens are known
  questions
    - does whitespace indicate a new token? -> yes
    - for div and remainder -> how should i convert non-integer results to integers? trunc or round?
      - assume truncate
    - for numbers, will positive numbers ever be identified with `+` -> no
                   will `-` always indicate negative or can it ever mean anything else? -> only negative
    -              will n always be an integer? -> yes
    - should the function return any values? -> no
Examples
  expected inputs:
    n push -> given
    add -> given
    sub
    mult
    div
    remainder
    pop
    print -> given
    no print
    all in combination cases
    no stack modifications
      push 5 times, update register 3 times, pop and print 5 times
  other cases:
Data Structure
  array, single variable holding register
Algorithm
  initialize stack
  initialize register
  split string into tokens
  for each token
    if token matches number regex, update register
    switch
      push: push register to stack
      add: pop value and reassign register +=
      sub: pop value and reassign register -=
      mult: pop value and reassign register *=
      div: pop value and reassign register /=, but truncated
      remainder: pop value and reassign register %=
      pop: pop value and reassign register
      print: log current register
*/

function minilang(commandString) {
  let stack = [];
  let register = 0;
  let tokens = commandString.split(' ');

  tokens.forEach((token) => {
    if (/-?[0-9]+/.test(token)) register = parseInt(token, 10);

    switch (token) {
      case 'PUSH':
        stack.push(register);
        break;
      case 'ADD':
        register += stack.pop();
        break;
      case 'SUB':
        register -= stack.pop();
        break;
      case 'MULT':
        register *= stack.pop();
        break;
      case 'DIV':
        register = Math.trunc(register / stack.pop());
        break;
      case 'REMAINDER':
        register %= stack.pop();
        break;
      case 'POP':
        register = stack.pop();
        break;
      case 'PRINT':
        console.log(register);
    }
  });
}

// minilang('5 PUSH PUSH PUSH PUSH PUSH 9 PRINT PRINT PRINT POP PRINT POP PRINT POP PRINT POP PRINT POP PRINT');
// minilang('5 PUSH PUSH PUSH PUSH PUSH 9 10 11 12 POP PRINT POP PRINT POP PRINT POP PRINT POP PRINT');


// minilang('PRINT');
// // 0

// minilang('5 PUSH 3 MULT PRINT');
// // 15

// minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// // 5
// // 3
// // 8

// minilang('5 PUSH POP PRINT');
// // 5

// minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// // 5
// // 10
// // 4
// // 7

// minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// // 6

// minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// // 12

// minilang('-3 PUSH 5 SUB PRINT');
// // 8

// minilang('6 PUSH');
// // (nothing is printed because the `program` argument has no `PRINT` commands)

