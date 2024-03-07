require "pry-byebug"

def bubble_sort!(arr)
  loop do
    pre_swap = arr.clone

    arr[0..-2].each_index do |idx|
      curr_pair = arr[idx,2]

      correct_order = if block_given?
                        yield(*curr_pair)
                      else
                        curr_pair[0] < curr_pair[1]
                      end
      # binding.pry
      arr[idx,2] = curr_pair.reverse! unless correct_order
    end
    return arr if arr == pre_swap
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)