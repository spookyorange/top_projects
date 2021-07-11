def fibs(n)
  returned_array = Array.new()
  i = 0
  while i <= n
    if i == 0
      returned_array.push(0)
    elsif i == 1
      returned_array.push(1)
    else
      returned_array.push(returned_array[i - 2] + returned_array[i - 1])
    end
    i += 1
  end
  return returned_array
end

def fibs_rec(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  array = fibs_rec(n - 1)
  array << array[-2] + array[-1]
end

puts fibs_rec(6)