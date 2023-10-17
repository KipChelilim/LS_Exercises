def palindromic_number?(num)
  test = num.to_s
  test.reverse == test
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true