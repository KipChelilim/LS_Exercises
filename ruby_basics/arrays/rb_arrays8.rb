org_array = ['Dave', 7, 'Miranda', 3, 'Jason', 11]

fav_names = org_array[(0..).step(2)]
fav_numbers = org_array[(1..).step(2)]

p new_array = fav_names.zip(fav_numbers)

