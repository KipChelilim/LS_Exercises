# give value to the block perform transformation
# return transformed value and compare it to prior transformed value
# set the max equal to the value that returns largest transformed value


def max_by(collection)
  max = collection.first
  collection.each do |element|
    max = element if yield(element) > yield(max)
  end
  max
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil