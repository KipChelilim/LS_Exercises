=begin
PEDAC
  start: 2:51
  finish:
  time:

Problem
  explicit rules:
    acccept a positive integer as an argument
    return an array of each individual digit

  implicit rules:
    array should be in same order as it appears in integer

  clarifying questions:
    are there any built in methods i shouldn't use? => try without digits

Examples
  12345

Data
  input: integer
  intermediate:
    current number (update after getting digit)
    truncated_num = (current number / 10 * 10)
    array for digits
  output: array

Algorithm (with digits)
  accept integer
  call digits
  reverse array
  return

Algorithm (without digits)
  accept integer
  get my rounded number and modulo w/ truncated number to get digit
  remove trailing digit by dividing by 10
  restart until number is < 10
  add final digit



  # loop until current number < 10
  #   round current number to tenths place
  #   get modulo of starting num % rounded num
  #   put digit at start of array
  #   remove digit just added (divide by 10)
=end

def digit_list(integer)
  integer.digits.reverse
end

# def digit_list(integer)
#   digits_array = []
#   current_number = integer

#   until current_number < 10
#     rounded_number = current_number / 10 * 10
#     digits_array.unshift(current_number % rounded_number)
#     current_number /= 10
#   end

#   digits_array.unshift(current_number)
#   digits_array
# end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true