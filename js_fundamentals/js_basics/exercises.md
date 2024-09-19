### Building Strings
Expected a single line string (due to escaped line break), with multiple spaces
between each "line" since the escape character only works on the line break.

- Missed the `SyntaxError` due to running this with a code editor.

### Conditionals pt 1
-  7: `'Hello'`
- 11: nothing since hello is truthy and `!` turns it into false
- 15: `World` as the object is truthy and `!!` turns it into true
- 19: `'!'` since myArray is truthy so there is at least one true value

### Conditionals pt 2
6
- Miss; double counted condition1. condition2 and not condition2 only occur in
  the case where condition1 is true so ignore condition1 and only count 2 paths
  when condition1 is true. Then, not condition1 could execute by  itself, or it
  can execute with condition4 only, or it can execute with condition4 AND
  condition5. 2 scenarios if condition1 is true, 3 scenarios if it is not.

### String Assignment
Bob Bob, since toUpperCase returns a new string object (no mutation on
primitives).

### Arithmetic Integer
arithmetic_integer.js

### Counting the Number of Characters
character_count.js

### Converting String to a Number
string_to_number.js

### Convert a String to a Signed Number
see prior solution: string_to_number.js

### Convert Number to a String
number_to_string.js

### Convert Signed Number to a String
see prior solution: number_to_string.js