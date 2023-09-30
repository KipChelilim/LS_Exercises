PASSWORD = "badpassword"
USERNAME = "fakename"

loop do
  puts ">> Please enter your username:"
  username_input = gets.chomp
  
  puts ">> Please enter your password:"
  password_input = gets.chomp
  
  break if username_input == USERNAME && password_input == PASSWORD
  
  puts ">> That username and/or password is incorrect."
end

puts "Welcome #{USERNAME}!"