# Constants for valid input tests
ACCEPTABLE_NON_NUMERICS_DOLLARS = %w(. , $)
ACCEPTABLE_NON_NUMERICS_RATE = %w(. , %)

# Method definitions
def valid_dollar_amount(num)
  num.each_char do |character|
    return false unless character.to_i.to_s == character ||
                   ACCEPTABLE_NON_NUMERICS_DOLLARS.include?(character)
    true
  end
end

def valid_rate(num)
  num.each_char do |character|
    return false unless character.to_i.to_s == character ||
                   ACCEPTABLE_NON_NUMERICS_RATE.include?(character)
    true
  end
end

def return_bill_input
  loop do
    input = gets.chomp
    return input if valid_dollar_amount(input)
    print "Invalid input. Please try again: "
  end
end

def return_rate_input
  loop do
    input = gets.chomp
    return input if valid_rate(input)
    print "Invalid input. Please try again: "
  end
end

# Main program
print 'What is the bill? '
pre_tip_bill = return_bill_input.delete('$').to_f
print 'What is the tip percentage? '
tip_rate = return_rate_input.to_f / 100

tip_amt = (pre_tip_bill * tip_rate).round(2)
total_bill = pre_tip_bill + tip_amt

puts "\n"
puts "The tip is $#{format('%.2f', tip_amt)}"
puts "The total is $#{format('%.2f', total_bill)}"
