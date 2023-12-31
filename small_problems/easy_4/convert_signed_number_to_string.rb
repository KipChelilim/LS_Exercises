=begin
PEDAC start 150 finish 213 distracted
Problem
  -explicit rules:
    -convert an integer into string representation
    -should be able to handle negative, zero, and positive
    -do not use standard conversion methods

  -implicit rules:
    -sign follows standard convention, '-' at front of value
    -if a positive number, add a plus, if negative '-', if zero nothing

  -clarifying questions:
    -do I have the correct sign rules for the output
    - will positive numbers never have the sign? yes, thats

Examples
  - postive number:  4321 => "+4321"
  - negative number: -123 => "-123"
  - zero: 0 > "0"

Data
  -input: integer value, pos, neg, and zero
  -intermediate: array of digits, variable to indicate if its a sign or zero
  -output: string value

Algorithm
  - create constant var `DIGITS` for mapping
  - identify sign of integer or if it is zero, store string representation as `sign_or_zero`
      # 4321 => sign_or_zero == '+'
      # -123 => sign_or_zero == '-'
      #    0 => sign_or_zero == ''
  - if string is negative, reassign input to absolute value of integer
      # -123 => integer == "123"
  - call integer to string method and store as `string_integer`
      # -123 => string_integer == "123"
  - return concatentated `sign` and `string_integer` (combine with prior step)
      # -123 => sign + string_integer == -123
=end


DIGITS = (0..9).to_a.zip(('0'..'9').to_a).to_h

def integer_to_string(integer)
  string_digits = integer.digits.reverse.map { |digit| DIGITS[digit] }
  string_digits.join
end

def signed_integer_to_string(integer)
  sign_or_zero = if    integer.positive? then "+"
                 elsif integer.negative? then "-"
                 else                         ""
                 end
  integer *= -1 if sign_or_zero == '-'
  sign_or_zero + integer_to_string(integer)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'