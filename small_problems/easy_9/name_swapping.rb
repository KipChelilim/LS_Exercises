=begin
PEDAC
  start 248
  finish 250
  time 1-2min
Problem
  rules
    accpet a string representing a first & last name delimited by a space
    return string with the last name, then first name, delimited by ", "
=end

def swap_name(string)
  string.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'