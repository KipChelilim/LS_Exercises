### Defaults - yes, but focus was on 0 being falsy though valid.
Neither controls for a missing price argument or for incorrect data types
for the optional values. If a string is provided it will be truthy but could
produce NaN

### Equal - technically yes, but focus was how to get object comparison to
### return true
The issue is that the comparison is at the object level, which will only return
true if both objects are the same. The code should access the `name` property in
order to compare the values. Since the values are strings, the comparison
includes equivalence.
  - `console.log(person.name === otherPerson.name);`

### Amount Payable
The `totalPayable` function multiplies its arguments and adds the result to the
`startingBalance` variable, but does not reassign it; the resulting sum is
returned. The same arguments are used in both function calls, so the only change
between lines 10 and 13 is the starting balance. The `startingBalance` variable
is available to the function, so each line logs 40 and 45.

### Caller
doubler.js

### What's my value
- 3 since length is always equal to 1 more than the highest index and does not
include the non-negative property created on line 3
- 4 since the property will be included with the indicies as the return value
from `Object.keys`
- 3 since `-2` is not a non-negative integer so it is not an index
- 5 since another property was created

### Length - wrong, on the last one, still shows up as empty item
- ['JavaScript', 'Ruby', 'Python'] is the the string representation of an array
- 3 since the highest index is 2

- ['JavaScript', 'Ruby', 'Python', <1 empty item>] since changing the length
created an empty position in the array
- 4

- ['JavaScript'] since length truncated the array and the values at removed
indexes were dropped
- 1

- ['JavaScript', <2 empty items>]
- 3 since the length property was set to 3

- ['JavaScript', undefined, 'Python']
- undefined
- 3

### The Red Pill
Welcome
to
the
Matrix!