# Main Problem
def print_in_box(text)
  padding = text.to_s.size + 2
  top_bottom_boarder = "+#{"-" * padding}+"
  buffer_line = "|#{" " * padding}|"

  puts "#{top_bottom_boarder}\n#{buffer_line}"
  puts "| #{text.to_s} |"
  puts "#{buffer_line}\n#{top_bottom_boarder}"
end

print_in_box('To boldly go where no one has gone before.')
puts "\n"

# Further exploration problem
# Solution needed: should split by new line characters in text, then by MAX_SIZE
MAX_SIZE = 76

def print_lines_in_box(lines_array, box_size)
  lines_array.each do |line|
    line.rstrip!
    final_padding = box_size - line.size
    puts "| #{line}#{" " * final_padding} |"
  end
end

def print_in_box_wrapped(text)
  largest_line = [MAX_SIZE, text.to_s.size].min
  padding = largest_line + 2
  top_bottom_boarder = "+#{"-" * padding}+"
  buffer_line = "|#{" " * padding}|"
  
  lines = text.to_s.scan(/\S.{1,#{MAX_SIZE-1}}[\s^.]/)
  puts top_bottom_boarder
  puts buffer_line
  print_lines_in_box(lines, largest_line)
  puts buffer_line
  puts top_bottom_boarder
end

print_in_box_wrapped("#{'To boldly go where no one has gone before.' * 7}")