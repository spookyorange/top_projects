# frozen_string_literal: true

def merge_sort(array)
  n = array.length
  merged_sorted = Array.new(n)
  return array if n < 2

  left_half = merge_sort(array[(0..(n / 2) - 1)])
  right_half = merge_sort(array[(n / 2)..-1])

  i = 0
  while i < n
    if right_half[0].nil?
      merged_sorted[i] = left_half[0]
      left_half = left_half[1..-1]
    elsif left_half[0].nil?
      merged_sorted[i] = right_half[0]
      right_half = right_half[1..-1]
    elsif right_half[0] >= left_half[0]
      merged_sorted[i] = left_half[0]
      left_half = left_half[1..-1]
    elsif right_half[0] < left_half[0]
      merged_sorted[i] = right_half[0]
      right_half = right_half[1..-1]
    end
    i += 1
  end
  merged_sorted
end
my_arr = [1, 1, 2, 3, 5, 6, 120, 420, 69, 7, 9, 10]
print merge_sort(my_arr)
