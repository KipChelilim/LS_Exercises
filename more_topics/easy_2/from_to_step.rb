def step(range_start, range_end, step)
  counter = range_start
  loop do
    yield(counter)
    break if (counter + step) > range_end
    counter += step
  end
  counter
end

p step(1, 10, 3) { |value| puts "value = #{value}" }