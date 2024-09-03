### Local vs Global 1
`This is global` because the `myVar` variable declaration on line 4 creates a
separate function local variable which is inaccessible in the global scope.

### Local vs Global 2
`This is local` for the same reasons as 1. This time `console.log` is within the
called from within function so the `myVar` referenced on line 5 is the local
variable.

### Local vs GLobal 3
`This is local` because the `myVar` variable on line 4 is the global variable.
Since a new variable was not declared, the global variable is included in the
closure and this reassignment operation changes the value assigned to `myVar`.

### Variable Lookup
`This is global`, for the same reasons as 3 - `myVar` is available within the
function.

### Variable Scope
`This is global` since JS creates a property on the global object when there is
a reassignment operation from an inner scope and it cannot find an initialized
variable.

### Arguments 1
`7` since the function performs a reassignment operation on the function local
variable `b`. Also, `a` references an immutable primitive value so `a` will
always reference the same value unless it is reassigned.

### Arguments 2
Same answer as Arguments 1. `a` on line 4 is a function local variable, not the
same as the global variable `a` on line 1.

### Arguments 3
`[ 1, 2, 10 ]` because the `myValue` function performs an  reassignment
operation on the 3rd element of the original array object. This mutates the
array since references to objects are passed into functions, resulting in global
variable `a` and function local variable `b` referencing the same object.

### Variable Declarations
`undefined` since `a` gets hoisted and initialized as `undefined` (initializers
are not hoisted with the variable declaration).

### Function Declarations
`Hello, world!` because the function declaration gets hoisted with its function
body.

### Function Declarations - Further Exploration
`string` since the function definitions get hoisted, and then during execution,
the initializer on line 1 is executed, which reassigns logValue to a string
value.
  ```jsx
  \\ Equivalent code
  function logValue() {
   console.log('Hello, world!');
  }
  
  logValue = 'foo';

  console.log(typeof logValue);
  ```