=begin
PEDAC start 4:01 finish 4:33, side tracked method hunting to solve bug
Problem:
  # explicit rules:
    # take a string value representing an integer number
    # convert it to an integer object
    # do not use Ruby's conversion methods
    # ignore leading + or minus signs or invalid characters
    # assume all characters are numerics in string format
  # implicit rules:
    # input will be number greater than or equal to 0
  # clarifying questions:
    #

Examples:
  # see below
  # 1 => 1 digit value
  # 0 => zero
  # 570 => three digit value
  # 4321 => four digit value

Data:
  # input: string
  # intermediate:
    # array to capture digits
    # range or array of string values and corresponding integer version (hash?)
  # output: integer

Algorithm
  # construct hash of string digits (keys) and integer values (value) (constant variable)
  # break string into characters (chars)
  # look up integer version of string characters (hash lookup)
  # convert digits to correct place (e.g. [1, 0, 0] => [100, 00, 0]
        # example: 3 digit number, array size is 3, first digit x 10^2 or length - 2
    # reverse the array
    # for each element in array
      # multiply value by 10 ^ n, where n starts at 0 and increases by 1 for each iteration(each_index)
  # sum digits and return result as integer

Code
=end

STRING_TO_NUMBER_LOOKUP = ('0'..'9').to_a.zip((0..9).to_a).to_h

def string_to_integer(string_as_num)
  characters_arr = string_as_num.chars
  digits_arr = characters_arr.map { |char| STRING_TO_NUMBER_LOOKUP[char] }.reverse

  digits_arr.each_index do |index|
    digits_arr[index] *= 10**index
  end

  digits_arr.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('0') == 0
p string_to_integer('1') == 1