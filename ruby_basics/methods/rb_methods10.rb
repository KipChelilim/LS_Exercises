def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
 "#{name} likes to go #{activity} on the weekend."
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))