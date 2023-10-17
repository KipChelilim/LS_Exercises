# Main problem & further exploration problems, 
# reverse method works on both array and string
def palindrome?(text)
  text.reverse == text
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true