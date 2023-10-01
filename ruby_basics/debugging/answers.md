## Debugging Practice Questions

# Anwers are before looking at solutions
# Markup underneath is self-grading and notes on why I missed

1) will give error on line 9 as this passes multiple arguments vs a list with
   those numbers as a single argument
   
   also, the return will end this funtion without evaluating remaining values
   in list, vs continuing to iterate. need to use next.

# missed the "NoMethodError" on single integer, but above solution would have
# solved it

   
2) see rb_debugging2.rb
   issue is that the values being sampled are string, not boolean. they will
   always evaluate as true (since they are truthy values) and produce same
   output fix is to remove quotes
   
# correct
   
3) need to convert the input to an integer, as it defaults to string
   
   also, could include validity check/conversion for values written
   as string (e.g. "Ten")
   
# correct

4) see rb_debugging4.rb
   issue is that bowser replaced the value for :dog key vs appending it to
   the nested list which is the current value
   
# correct

5) map performs a function within the block on each element, then returns
   result. we are trying to filter so should use the select/filter method to
   select desired values
   
   current code will return all elements 'n', but replace odd values with nil
   since we do not specify an else value in the if statement
   
# correct
   
6) see rb_debugging6.rb
   the function is returning nil, which can't be concatenated with the #+ method
   need to specify a return value that results in a string (not puts as puts
   also returns string)
   
   also, each if is being evaluated independently, so final if results in nil
   value because there's no result if false. refactor to a single if/case
   statement

# correct

7) assigned the calc of each month to balance variable instead of adding it.
   us += operator on ln32 to calc cumulative balance

# correct
   
8) see rb_debugging8.rb
   the things array is shorter than colors which is our error check to break the
   loop. we're also using length but our iterator is the index position. this
   will error out on final sentence because there's no value at things[i].
   should use an or on break statement to check both lists and compare against
   length minus 1
   
   depending on nature/objective of this type of function, add warning message
   that lists are not same length or that one list has residual values not
   printed

# correct

9) see rb_debugging9.rb
   everything * 0 is 0; product variable should start at 1

# correct
   
10) see rb_debugging10.rb
    need to add a block specifying how to handle duplicate keys
    also need to convert the input into a symbol in order to use it as a key
    also need to merge in place if the player variable should change
    
    given use case, better approach would be to use the 'player' hash variable 
    universally as base stats, create a 'profile' or 'character name' hash
    variable (based on a user input for naming), and  assign the merge to this 
    new variable to make up current player stats. events in game would create
    values that are converted to hashes and added to current profile stats for
    cumulative stat sheet. based on stat management & mechanics (weapons,
    permanent or temp buffs/debuffs, rolling back stat upgrades, etc) these
    events would be stored for reference to be undone later. but not recalc'd
    every time they would be used (resource inefficient)