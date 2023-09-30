def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop do
    number = gets.chomp
    return number if valid_number?(number)
    puts "Invalid input. Enter a non-zero integer:"
  end
end

first = nil
second = nil

loop do
  puts ">> Enter a positive or negative integer (1/2):"
  first = get_number.to_i
  
  puts ">> Enter a positive or negative integer (2/2):"
  second = get_number.to_i

  break if first * second < 0
  puts "One number must be positive and one negative. Please start over.\n\n"
end

result = first + second
puts "#{first} + #{second} = #{result}"