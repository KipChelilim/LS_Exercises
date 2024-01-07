=begin
PEDAC
  start 420
  finish 429
  time 9 min
Problem
  rules
    accept an array of elements
    return an array of elements whose indices are odd
=end

def oddities(array)
  array.each_with_object([]) do |value, result|
    position = array.index(value) + 1
    result << value if position.odd?
  end
end

def evens(array)
  even_indices = 1.step(by: 2, to: array.size-1).to_a
  even_indices.each_with_object([])  |target_index, result|
      result << array[target_index]
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]