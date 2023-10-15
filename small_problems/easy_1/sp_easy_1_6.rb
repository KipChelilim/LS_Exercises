# Main problem
def triangle(integer)
  integer.times do |num|
    num += 1
    puts "#{' ' * (integer - num)}#{'*' * num}"
  end
end

# triangle(9)


# Further Exploration: Upside-down
def upside_down_triangle(integer)
  integer.times do |num|
    puts "#{' ' * num}#{'*' * (integer - num)}"
  end
end

# upside_down_triangle(9)


# Further Exploration: All corners based on input
TRIANGLE_SIDE = { right: [0, 1], left: [1, 0] }

def any_triangle(integer, vertical = 'upper', horizontal = 'right')
  right_side_modifier = TRIANGLE_SIDE[horizontal.to_sym][0]
  left_side_modifier = TRIANGLE_SIDE[horizontal.to_sym][1]
  triangle_lines = []

  integer.times do |num|
    triangle_lines << "#{' ' * (num * right_side_modifier)}"\
                      "#{'*' * (integer - num)}"\
                      "#{' ' * (num * left_side_modifier)}"
  end

  triangle_lines.reverse! if vertical == 'lower'
  puts triangle_lines
end  

# Examples to demonstrate code
any_triangle(9, 'lower', 'left')
any_triangle(9, 'upper', 'left')
any_triangle(9, 'upper', 'right')
any_triangle(9, 'lower', 'right')
