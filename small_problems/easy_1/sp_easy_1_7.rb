# Main problem
def madlib
  print 'Enter a noun: '
  noun = gets.chomp
  print 'Enter a verb: '
  verb = gets.chomp
  print 'Enter an adjective: '
  adjective = gets.chomp
  print 'Enter an adverb: '
  adverb = gets.chomp

  puts "\n"
  puts "My #{adjective} #{noun} is #{adverb} #{verb} on the roof! "\
       "Don't see that every day!"
end

madlib
