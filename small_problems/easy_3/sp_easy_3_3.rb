print 'Please write a word or multiple words: '
words = gets.chomp

character_count = words.gsub(' ', '').size

puts "There are #{character_count} characters in \"#{words}\"."