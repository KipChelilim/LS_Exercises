SQFT_CONVERSION = 10.7639

puts 'Enter the length of the room in meters:'
length_meters = gets.chomp.to_f
puts 'Enter the width of the room in meters:'
width_meters = gets.chomp.to_f

area_meters = length_meters * width_meters
area_sqft = (area_meters * SQFT_CONVERSION).round(2)

puts "The area of the room is #{area_meters} square meters "\
     "(#{area_sqft} square feet)."