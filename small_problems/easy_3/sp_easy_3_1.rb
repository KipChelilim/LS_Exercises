# Method definitions
# Solution needed: decimal point should only appear once - need test
def valid_num?(num)
  num.each_char do |char|
    return false unless char.to_i.to_s == char || char == '.'
  end
end

def get_user_input
  loop do
    input = gets.chomp
    return input.to_f if valid_num?(input)
    print "Please enter a valid number: "
  end
end

# Main program
first_five = []

# Refactor opp: loop w/ lookup to correct iteration text (e.g. 0 -> 1st, etc)
puts '==> Enter the 1st number: '
first_five << get_user_input
puts '==> Enter the 2nd number: '
first_five << get_user_input
puts '==> Enter the 3rd number: '
first_five << get_user_input
puts '==> Enter the 4th number: '
first_five << get_user_input
puts '==> Enter the 5th number: '
first_five << get_user_input

puts '==> Enter the 6th number: '
sixth_num = get_user_input

duplicate = first_five.include?(sixth_num) ? "appears" : "does not appear"
puts "The number #{sixth_num} #{duplicate} in #{first_five}."
