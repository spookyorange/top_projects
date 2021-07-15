class Node
  include Comparable
  attr_accessor :right, :left, :root
  def initialize(root=nil, left=nil, right=nil)
    @root = root
    @left = left
    @right = right
  end

  def put
    puts @root
  end
end

class Tree
  attr_reader :array
  def initialize(array)
    @array = array.uniq.sort
  end

  def root(a=@a)
    @root = a
    return @root
  end

  def build_tree(array, start=0, done)
    return if start > done
  
    mid = (done + start) / 2
    root = Node.new()
    root.root = array[mid]
    root.right = build_tree(array[mid + 1..-1], 0, array.length / 2 - 1)
    root.left = build_tree(array[0..mid - 1], 0, mid -1)
    return @a = root
  end

  def insert(value, pointer=@a)
    #if same
    return if pointer.root == value
    #if value bigger
    if value > pointer.root
      if pointer.right.nil?
        pointer.right = Node.new(value, nil, nil)
        puts pointer.root
        puts pointer.right.root
      else
        pointer = pointer.right
        self.insert(value, pointer)
      end
    #if value lesser
    else
      if pointer.left.nil?
        pointer.left = Node.new(value, nil, nil)
      else
        pointer = pointer.right
        self.insert(value, pointer)
      end
    end
  end

  def delete(value)

  end
end



my_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(my_array)
tree.build_tree(tree.array, 0, tree.array.length-1)
tree.insert(25)

puts tree.root