loop do
  puts ">> How many output lines do you want? Must be at least 3. (Q to quit)"
  input = gets.chomp
  lines = input.to_i
  
  break if input.downcase == "q"

  (puts "That's not enough lines"; next) if lines < 3
  
  lines.times { puts "Launch school is the best!" }
end