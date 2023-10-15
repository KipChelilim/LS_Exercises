# Main problem
def empty_string?(string)
  return false if string.nil? || string.empty?
  true
end

def center_of(text='')
  loop do
    break if empty_string?(text)
    print 'Please enter a valid string: '
    text = gets.chomp
  end

  midpoint_index = (text.size / 2)  

  text.size.odd? ? text[midpoint_index] : text[(midpoint_index - 1), 2]
end

# Tests
puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'