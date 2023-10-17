def real_palindrome?(text)
  string_to_test = text.delete("^a-zA-Z0-9").downcase
  string_to_test.reverse == string_to_test
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true
puts real_palindrome?("Madam, I'm Adam") == true
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false