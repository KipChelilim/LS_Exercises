### Logical Operation - wrong, forgot JS doesn't convert to boolean
- false
- undefined
- undefined
- false
- false
- undefined
- 'a'
- 'a'
- undefined
- undefined

# Conditional Loop
No - the code only increments the `i` when the remainder is 0, which is valid
for `i === 0`. The code never increments `i` and it prints 0 endlessly.

### Multiplication Table
This only produces 9 rows since the outer `for` loop increments up to 9.

### Selected Columns - yes, but missed the function vs block scope aspect also
The inner loop reassigns the control variable `length` used in the outer loop so
the code only loops through a number of rows equal to the number of columns
desired specified in `cols`.

### Counter - wrong on snippet 3, function declaration gets hoisted so the
### initializer reassigns counter from a function
- 15
- NaN
- NaN
- Error - variable already declared

### Logger
The variable status is initialized within the function `debugIt` and has
function scope, making it available to any nested scopes. The `logger` function
declared on lines 3-5 and outputs `status` to the console; `logger` is then
called on line 7. When `debugIt` is called on line 10, `status` is logged to the
console.

### Invoice
invoice.js

### Product of Sums - partial, missed `sum` not being assigned to a variable and
### preventing assignment operation. 
No, the total function needs to return the `sum` variable. Because the `return`
keyword is not used, the return value of total is undefined and `productOfSums`
will return `NaN`.