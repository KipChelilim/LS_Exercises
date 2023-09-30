puts ">> Do you want me to print something? (y/n)"
input = gets.chomp.downcase

until ["y","n"].include?(input)
  puts "Error: please enter 'y' or 'n'."
  puts ">> Do you want me to print something? (y/n)"
  input = gets.chomp.downcase
end

puts "something" if input == "y"