# Method definitions
def valid_integer?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def return_sum_upto(num)
  result = 0
  1.upto(num.to_i) { |each| result += each }
  result
end

def return_product_upto(num)
  result = 1
  1.upto(num.to_i) { |each| result *= each }
  result
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
operation = nil
loop do
  operation = gets.chomp.downcase
  break if %w(s p).include?(operation)
  print ">> Please enter 's' for sum or 'p' for product: "
end

case operation
when 's' then puts "The sum of the integers between 1 and #{integer} "\
                   "is #{return_sum_upto(integer)}."
when 'p' then puts "The product of the integers between 1 and #{integer} "\
                   "is #{return_product_upto(integer)}."
end