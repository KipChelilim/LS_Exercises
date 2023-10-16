def valid_age?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def get_age_input
  loop do
    input = gets.chomp
    return input if valid_age?(input)
    print 'Please enter a whole number greater than 0: '
  end
end

print 'What is your age? '
current_age = get_age_input

print 'At what age would you like to retire? '
retire_age = nil
loop do
  retire_age = get_age_input
  break if retire_age > current_age
  print 'Your retirement age should be greater than your current age: '
end

remaining_years = retire_age.to_i - current_age.to_i
curr_year = Time.now.year

puts "\n"
puts "It's #{curr_year}. You will retire in #{curr_year + remaining_years}."
puts "You have only #{remaining_years} years of work to go!"
