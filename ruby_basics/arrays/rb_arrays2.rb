pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets.values_at(2,3)

puts "I have a pet #{ my_pet[0] } and a pet #{ my_pet[1] }!"