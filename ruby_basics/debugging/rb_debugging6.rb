def get_quote(person)
  case person
  when 'Yoda'
    'Do. Or do not. There is no try.'
  when 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  when 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'