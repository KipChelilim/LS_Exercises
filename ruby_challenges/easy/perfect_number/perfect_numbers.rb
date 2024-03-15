=begin
start  10:13
finish 10:34
time 21 min

Problem
  accept an integer and determine if it is
    perfect: Aliquot sum is equal to the original number
    abundant: aliquot sum greater than original number
    deficient: aliquot sum less than original number
  aliquot sum:
    positive divisors added together

  test cases:
    create PerfectNumber class
    use a class method to test perfect numbers
    raise standard error if number is < 0
    return string in lower case: perfect, abundant, deficient

Examples:
  perfect:
    6  (1, 2, 3)
    28 (1, 2, 4, 7, 14)
  abundant:
    24
  deficient:
    15
    all prime numbers
Algorithm
  take a number
  test if its valid and raise standard error if not
    raise error if less than 0
  get list of divisors and add them together
    get square root of number
    iterate from that number down to 1
      for each potential, add it and num / potential if num mod potential == 0
  determine category
    sum result of divisor list
    if equal, perfect...
=end

class PerfectNumber
  def self.classify(integer)
    raise StandardError if integer < 1
    aliquot = divisors(integer).sum
    case aliquot
    when (...integer) then "deficient"
    when integer      then "perfect"
    else                   "abundant"
    end
  end

  class << self
    private

    def divisors(integer)
      square_root = Math.sqrt(integer).to_i
      divisors = [1]
      2.upto(square_root) do |num|
        if (integer % num) == 0
          divisors << num
          divisors << integer / num
        end
      end
      divisors
    end
  end
end