=begin
PEDAC start 129 finish 139
Problem
  -explicit rules:
    take a zero or positive integer and convert it to its string representation
    do not use any built in conversion methods
  -implicit rules
    do not worry about signs

  -clarifying questions:

Examples
  -0 => "0"
  -4321 => "4321"
  -5000 => "5000"

Data
  -input: integer value
  -intermediate: array after splitting digits
  -output: string value

Algorithm
  - create hash `DIGITS MAPPING` with mapping between integer 0-9 and string representation
  - split integer into individual digits and map to string value as `string_digits`
  - join `string_digits` without a delimiter
  - return `string_digits`
=end

DIGITS_MAPPING = (0..9).to_a.zip(('0'..'9').to_a).to_h

def integer_to_string(integer)
  string_digits = integer.digits.reverse.map { |digit| DIGITS_MAPPING[digit] }
  string_digits.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Alt solution to use array of digits as array indices are same as integer hash keys