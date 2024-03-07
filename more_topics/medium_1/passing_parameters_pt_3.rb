items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# First
gather(items) do |*fruits_and_vegetables, grain|
  puts fruits_and_vegetables.join(", ")
  puts grain
end

# Second
gather(items) do |fruit, *vegetables, grain|
  puts fruit
  puts vegetables.join(", ")
  puts grain
end

# Third
gather(items) do |fruit, *remaining|
  puts fruit
  puts remaining.join(", ")
end

# Fourth
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end