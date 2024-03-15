=begin
Time
  start 918
  finish 946
  time 28min
  refactor
Problem
  accept an octal input string and convert it to decimal output
  any invalid input should be considered octal 0
  do not use built in or library methods
  octal conversion:
    octal is base 8 number system
  test cases:
    implement a class `Octal`
    use instance method `to_decimal`
    treat invalid octal numbers as 0
      each digit can only be 0-7
      non-numeric treated as 0
      leading zeroes are okay
      do not drop invalid characters at end, if any are invalid then zero
Examples
  octal number 233
    2 => 8^2 * 2 => 64 * 2 => 128 => 155
    3 => 8^1 * 3 => 8  * 3 =>  24
    3 => 8^0 * 3 => 1  * 3 =>   3
Data
  input: string
  intermediate:
    converstion to integer
    array of digits after conversion
  output: integer
Algorithm
  instantiate an `Octal` object
    pass in a string
    if it has digits that are outside 0-7, just use 0 as the instance variable
  calculate decimal conversion
    get array of digits
    multiple each digit by 8^ of the index position
    sum the result
    return the integer
=end

class Octal
  def initialize(octal_string)
    @octal_number = convert_to_numeric_octal(octal_string)
  end

  def to_decimal
    octal_number.digits.map.with_index do |digit, idx|
      digit * (8 ** idx)
    end.sum
  end

  private

  attr_reader :octal_number

  def convert_to_numeric_octal(string)
    return 0 if string =~ /[^0-7]/
    string.to_i
  end
end