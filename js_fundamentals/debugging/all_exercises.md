### Hello Friends
- hello_friends.js
- Didn't call randomGreeting with parens and did not explicitly return a value

### Includes False
Line 5 uses the loose equality operator to test if the value is equal to false.
This evaluates 0 as equivalent to false since it is falsy and returns. The
comparison on line 5 should be changed to `element === false`.

### Place a Bet - i knew the issue, but not why it raises an error
Parens around the function declaration

### Picky museum filter
museum.js

### Shop Transactions
Line 21 doesn't pass the error to the catch block on line 21

### Full Moon - missed the point of the code / question. Not about printing transformed vs not transformed. Its about only printing message when a 'were' creature is present. Need let so that the variable `newSpecies` is uninitialized on each iteration so that it returns a falsy value and nothing is output on on line 22.

moon.js
The `newSpecies` variable is only reassigned when its transformable. One fix is
to add an initializer to line 15 so `newSpecies` always equals the next element
on each iteration. An alternative is to add an else statement that assigns
`newSpecies` to `thisSpecies` when not transformable.

### Space Design - half right, caught the string coercion but missed that its the same key still accessible and reassigned to undefined on line 24. Keys are valid just wrong.
- Computed property names are not allowed, so lines 22 - 24 will coerce the objects to strings and assign the resulting string as the property name. As a result, the keys used in lines 33 and 34 do not exist and will return undefined.

### Expensive Study Prepration
study.js

The error is that line 21 checks if the `amount` argument is falsy to determine whether it should be set to 1 by default. However, 0 is falsy but still a valid value for the cart. The check should use the nullish coelescing operator to assign the value if amount is `undefined` or `null`.

### Stuck on Page 18
stuck.js
Because line 19 recursively calls the `read` function, the page number is always reset to 1 at the start of each function call. The code can never meet a the condition on line 18 that doesn't call `read` so the program runs continuously.