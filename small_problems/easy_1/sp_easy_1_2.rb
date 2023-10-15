# Main Problem & further exploration part 1
def is_odd?(num)
  return false if (num == 0) || (num % 2 == 0)
  true
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

# Further exploration part 2
def is_odd_remainder(num)
  return false if (num == 0) || (num.remainder(2) == 0)
  true
end

puts "\n"
puts is_odd_remainder(2)
puts is_odd_remainder(5)
puts is_odd_remainder(-17)
puts is_odd_remainder(-8)
puts is_odd_remainder(0)
puts is_odd_remainder(7)
