=begin
PEDAC
  start 943
  finish 1017
  time 34min
Problem
  rules
    take a positive integer as an argument
    evaluate if the number is prime
      not 1
      not even
      only divisible by itself and 1
    return true if prime false if not
  clarifying questions
Example
  24
Algorithm
  calculate square root
  return false if number is equal to 1, even, or square root is an integer

  from 3 up to number/2, by 2
    return false if a n is divisible by one of those numbers then prime
=end
def is_prime(n)
  return true if n == 2
  return false if n == 1 || n.even? || (Integer.sqrt(n).pow(2) == n)

  3.step(by: 2, to: n / 3).each do |divisor|
    return false if n % divisor == 0
  end
  true
end

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true