=begin
PEDAC
  start 3:52
  finish 3:58
  time 6 min

Problem
  explicit rules
    take an array and create a new array with each element in reverse order
    do not use reverse or reverse!
    do not modify the original array
    do not use prior method
  implicit rules
    empty arrays should return empty arrays
    change element position, not the elements
  clarifying questions

Examples
Data
Algorithm
  take each element, and shift into new array
=end

# Original solution
def reverse(array)
  new_array = []
  array.each { |element| new_array.unshift(element) }

  new_array
end

#Further exploration
# def reverse(array)
#   array.inject([], :unshift)
# end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true