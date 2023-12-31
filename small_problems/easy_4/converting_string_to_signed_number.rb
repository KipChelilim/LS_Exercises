=begin
PEDAC start 445 finish 520 still too hack and slashy, still thinking too complex in algorithm
Problem
  # explicit rules
    # accept string of digits that may have leading sign
    # convert to integer with appropriate sign
    # do not use inherent conversion methods
    # assume string is always a valid number
    # can use prior string to number method
  # implicit rules
    # input is integer, not other numeric types
  # clarifying questions
    # assume sign is leading character? (i.e. no leading spaces etc)

Examples
  # see below

Data
  # input: string with + or - leading character and remaining digits
  # intermediate:
  # output: integer

Algorithm
  # add sign to a separate hash with converted value (1 or -1)
  # assign `sign` to lookup of first character in sign hash (if nil, no sign provided)
  # remove leading sign and convert to integer
    # if `sign` is nil,
      # assign string[1..-1] to `unsigned_string` variable
      # otherwise, just pass string
  # call conversion method with `unsigned_string`
  # multiply method return value by `sign` variable

Code
=end

STRING_TO_NUMBER_LOOKUP = ('0'..'9').to_a.zip((0..9).to_a).to_h
SIGNS = {'-' => -1, '+' => 1}

def string_to_integer(string_as_num)
  characters_arr = string_as_num.chars
  digits_arr = characters_arr.map { |char| STRING_TO_NUMBER_LOOKUP[char] }.reverse

  digits_arr.each_index do |index|
    digits_arr[index] *= 10**index
  end

  digits_arr.sum
end

def string_to_signed_integer(string)
  first_char = string[0]
  sign = SIGNS[first_char]

  unsigned_string = sign.nil? ? string : string[1..-1]

  sign = 1 if sign.nil?
  string_to_integer(unsigned_string) * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100