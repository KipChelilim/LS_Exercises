# Main Problem
def stringy(num)
  base = num / 2
  num.even? ? ('10' * base) : ('10' * base) + '1'
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further Exploration
def stringy_v2(num, start = 1)
  alt = (if start == 1 then 0 else 1 end)
  base = num / 2
  if num.even?
    "#{(start.to_s + alt.to_s) * base}"
  else
    "#{(start.to_s + alt.to_s) * base}#{start}"
  end
end

puts stringy_v2(6, 0)
