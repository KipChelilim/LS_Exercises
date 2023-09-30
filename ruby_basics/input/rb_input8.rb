def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts ">> Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts ">> Only integers allowed."
end

loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  break if valid_number?(denominator) && denominator.to_i != 0
  puts ">> Only non-zero integers allowed."
end

puts "#{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}."