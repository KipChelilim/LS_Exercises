## Answers to Return questions before seeing solutions ##

1) Breakfast
2) Evening
3) Breakfast
4) Dinner
   Breakfast
   
5) Dinner
   # => "Dinner"
   
6) Breakfast
7) 1
   2
   3
   4
   5

8) 1
   2
   3
   4
   10

9) 1
   2
   
10) 1

## Corrections ##

5) correct answer is nil after Dinner - comes from puts in the method:
   Dinner
   nil

7) correct answer is 0-5; times iterates from 0 to 4 and returns the org integer 
   0
   1
   2
   3
   4
   5
   
8) after seeing answer to Q7, changing to below because times returns 5, but
   its not used since 10 is last evaluation; 2nd answer was correct

   0
   1
   2
   3
   4
   10
   
9) after seeing answer to Q7, changing to below because p argument, not puts,
   times iterates from 0, and return has no  value specified in method so nil;
   2nd answer was correct

   0
   1
   2
   nil