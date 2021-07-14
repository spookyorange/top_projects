class Node
  include Comparable
  attr_reader :root, :left, :right
  def initialize(root, left, right)
    @root = root
    @left = left
    @right = right
  end
  def put
    puts @root
  end
end

class Tree
  def initialize(array)
    @array = array
  end

  def root(return_val)
    @root = return_val
  end
end

def build_tree(array, start, done)
  return nil if start > done

  mid = (done + start)/2

  root = Node.new((array[mid]), build_tree(array[0..mid-1], 0, mid-1), build_tree(array[mid+1..-1], mid+1, array.length-1))
  return root
end


my_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
build_tree(my_array.uniq.sort, 0, my_array.uniq.sort.length - 1)
