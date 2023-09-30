lines = nil

loop do 
  puts ">> How many output lines do you want to enter? (at least 3)"
  lines = gets.chomp.to_i
  break if lines >= 3
  puts "That's not enough lines"
end

lines.times { puts "Launch school is the best!" }