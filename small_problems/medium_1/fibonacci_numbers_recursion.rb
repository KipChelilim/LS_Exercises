=begin
PEDAC
  start 709
  finish 718
  time 9 min
Problem
  rules
    write a recursive method to calculate the nth fibonacci number
    where n is an argument to the method
=end

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765