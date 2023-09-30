loop do
  puts ">> How many output lines do you want? Must be at least 3. (Q to quit)"
  input = gets.chomp
  break if input.downcase == "q"
  
  lines = input.to_i
  if lines < 3
    puts "That's not enough lines"
    next
  else
    lines.times { puts "Launch school is the best!" }
  end
end