def zip(array1, array2)
  result = []
  first = array1.clone
  second = array2.clone

  loop do
    result << [first.shift, second.shift]
    break if first.empty?
  end

  result
end


p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]