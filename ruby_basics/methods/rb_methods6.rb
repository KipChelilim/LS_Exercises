daylight = [true, false].sample

def time_of_day(bool)
  bool ? "It's daytime!" : "It's night time!"
end

puts time_of_day(daylight)