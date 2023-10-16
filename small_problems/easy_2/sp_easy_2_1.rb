# Main Problem
age = (20..200).to_a.sample
puts "Teddy is #{age} years old!"

# Further Exploration
print "Enter a name and I will guess their age: "
name = gets.chomp.capitalize
name = 'Teddy' if name.nil? || name.empty?
age = (20..200).to_a.sample
puts "#{name} is #{age} years old!"
