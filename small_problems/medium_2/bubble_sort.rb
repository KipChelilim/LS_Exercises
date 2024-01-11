=begin
PEDAC
  start 852
  finish 920
  time 28min
Problem
  rules
    accept an array as an argument
    sort the array using a  bubble sort algorithm in ascending order:
      take multiple passes through the array
      on each pass, take pair of consec. elements and compare them
      swap if the first is greater than second
      continue until no swaps are made
    perform the sort in place (i.e. mutate the object passed to the method)
    assume the array has at least two elements
  clarifying questions
    assume the array has elements of all the same type? (yes)
    sor tin
Example: [3, 2, 1]
  1: [2,3,1]
     [2,1,3]
  2: [1,2,3]
     [1,2,3]
  3: [1,2,3]
     [1,2,3]
     no swaps, done
Data:
  input: array
  intermediate:
    clone after first pass to compare if exchanges were made
  output: same array
Algorithm
  create a copy of the array before set of evaluations
  until the final array is equal to the cloned array
  for each element
      take pair of consec. elements and compare them
      swap if the first is greater than second
=end

def bubble_sort!(arr)
  loop do
    pre_swap = arr.clone

    arr[0..-2].each_index do |idx|
      curr_pair = arr[idx,2]
      arr[idx,2] = curr_pair.reverse! if curr_pair[0] > curr_pair[1]
    end

    return arr if arr == pre_swap
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)