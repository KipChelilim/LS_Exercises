# Constants
OPERATION_SYMBOLS = {s: :+, p: :*}

# Method definitions
def valid_integer?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

# Start of main program
puts ">> Please enter an integer greater than 0: "
integer = nil
loop do
  integer = gets.chomp
  break if valid_integer?(integer)
  print ">> Make sure to enter a whole number greater than 0: "
end

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation_input = nil
loop do
  operation_input = gets.chomp.downcase.to_sym
  break unless OPERATION_SYMBOLS[operation_input].nil?
  print ">> Please enter 's' for sum or 'p' for product: "
end

operation = OPERATION_SYMBOLS[operation_input]
result = (1..integer.to_i).inject(operation)

case operation_input
when :s
  puts "The sum of the integers between 1 and #{integer} is #{result}."
when :p
    puts "The product of the integers between 1 and #{integer} is #{result}."
end
