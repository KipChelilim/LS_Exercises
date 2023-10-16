print 'What is your name? '
name = nil
loop do
  name = gets.chomp.strip.capitalize
  break unless name.empty?
  print 'Please enter your name: '
end

if name[-1] == '!'
  puts "HELLO #{name.chop.strip.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
