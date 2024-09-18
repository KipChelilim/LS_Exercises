### Literal
On line 9, the `a` in the bracket notation needs quotes. Without quotes it is
attempting to access a variable which has not been declared.

### Literal Method
The functions will be represented as strings since `()` was not appended to each
method name to indicate that we wanted a method call.

### Mutation
The result will look like array 1 from line 1 since new string objects were
copied into array 2.
  - First, line ten reassigns each element of array 1 to a new value so this
    wouldn't impact array 2.
  - Second, the reassignment is done using a non mutating method
  - Third, since the elements are strings, they are immutable and the strings
    copied into array 2 on line 5 are different from of the strings originally
    within array 1.

### Dynamic
1. `678` because prop2 in bracket notation is a reference to the variable. The
variable was used to create property `456` with a value of `'678'`.

2. `456` because with dot notation, JS searches for that property name as a
   string (not possible to use a variable in dot notation). The property
   `prop2` was reassigned to `'456'` on line 8.

### Array Object Pt 1
- `a`
- `undefined`
- `d`
- `5`
- `['a', 'b', 'c', 'f', '-1': 'd', e: 5]`

### Array Object Pt 2
The result will be 10. The iterator variable will continue to incremement from
-1 up to 1 and the negative indices will be converted to strings when included
in the bracket notation on line 9. This allows us to access the 5s assigned as
values to properties and the two true elements. However, the length property
does not take the properties into account, so when the average is calculated, it
is calculated as 20 (5 added to the sum local variable 4 times) divided by 2
(the number of true elements, excluding key-value pairs).

### What's my Bonus? - kind of right - no blank in params so needed arguments
### object, not a rest parameter
The ternary expression is using bracket notation to access the second value in
an array that can be evaluted as a boolean, and then uses the first value of an
array to calculate the bonus when the first expression is true. This indicates
that the arguments passed in to the function should be collected into an array
with the same order seen on lines 5, 6, and 7. A rest parameter will allow this
function to work correctly.

```js
  function calculateBonus(...args) {
    return args[1] ? args[0] / 2 : 0;
  }

  console.log(calculateBonus(2800, true));               // 1400
  console.log(calculateBonus(1000, false));              // 0
  console.log(calculateBonus(50000, true));              // 25000
```

### End is Near
Can't use negative indices in bracket notation, so the code will log undefined.
You need to capture split string array and use its length to get the next to
last index or use the slice method (and convert the result to a string) since
slice does does allow negative indices.

` return string.split(' ').slice(-2, -1).toString(); // Line 2 using slice`

### After Midnight Pt 1
midnight1.js

### After Midnight Pt 2
midnight2.js
