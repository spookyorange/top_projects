module Enumerable
  def my_each()
    i = 0
    while self.length > i 
      yield(self[i])
      i += 1
    end
  end
  def my_each_with_index()
    i = 0
    while self.length > i
      yield(self[i], i)
      i += 1
    end
  end
  def my_select()
    self.my_each do |each|
      if yield(each)
        puts each
      end
    end
  end
  def my_all?
    self.my_each do |each|
      if yield(each) != true
        return false
      end
    end
    return true
  end
  def my_any?
    self.my_each do |each|
      if yield(each) == true
        return true
      end
    end
    return false
  end
  def my_none?
    self.my_each do |each|
      if yield(each) == true
        return false
      end
    end
    return true
  end
  def my_count
    count = 0
    self.my_each do |each|
      if block_given?
        if yield(each) != true
          next
        else
          count += 1
        end
      else
        count += 1
      end
    end
    return count
  end
  def my_map(&my_proc)
    returned_array = Array.new()
    if block_given?
      self.my_each do |each|
        returned_array.push(yield(each))
      end
    else
      self.my_each do |each|
        returned_array.push(my_proc.call(each))
      end
    end
    return returned_array
  end
  def my_inject(sum_start=0, symbol=nil)
    sum = sum_start
    self.my_each do |each|
      each.to_i
      sum = yield(sum, each)
    end
    return sum
  end
end
