class Node
  include Comparable
  attr_accessor :right, :left, :root

  def initialize(root = nil, left = nil, right = nil)
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

  def root(a = @a)
    @root = a
    @root
  end

  def build_tree(array, start = 0, done)
    return if start > done

    mid = (done + start) / 2
    root = Node.new
    root.root = array[mid]
    root.right = build_tree(array[mid + 1..-1], 0, array.length / 2 - 1)
    root.left = build_tree(array[0..mid - 1], 0, mid - 1)
    @a = root
  end

  def insert(value, pointer = @a)
    return if pointer.root == value

    if value > pointer.root
      if pointer.right.nil? && pointer.left.nil?
        pointer.right = Node.new(value, nil, nil)
      else
        insert(value, pointer.right)
      end
    elsif value < pointer.root
      if pointer.left.nil?
        pointer.left = Node.new(value, nil, nil)
      else
        insert(value, pointer.left)
      end
    end
  end

  def delete(value, pointer = @a, bef = @a)
    if value == pointer.root
      if pointer.right.nil? && pointer.left.nil?
        if bef.root < pointer.root
          bef.right = nil
        else
          bef.left = nil
        end
      elsif pointer.right.nil? && !pointer.left.nil?
        if bef.root > pointer.root
          bef.left = pointer.left
        else
          bef.right = pointer.left
        end
      elsif !pointer.right.nil? && pointer.left.nil?
        if bef.root > pointer.root
          bef.left = pointer.right
        else
          bef.right = pointer.right
        end
      elsif !pointer.right.left.nil?
        pointer.root = pointer.right.left.root
        pointer.right.left = nil
      else
        pointer.root = pointer.left.right.root
        pointer.left.right = nil
      end
      return
    end
    if value < pointer.root
      delete(value, pointer.left, pointer)
    elsif value > pointer.root
      delete(value, pointer.right, pointer)
    end
  end

  def find(value, pointer = @a)
    return false if pointer.nil?
    return pointer if pointer.root == value

    if pointer.root > value
      find(value, pointer.left)
    else
      pointer.root < value
      find(value, pointer.right)
    end
  end

  def level_order(pointer = @a)
    @all = Array.new
    queue = Array.new
    @all << pointer
    queue << pointer
    while !queue.empty?
      pointer = queue[0]
      queue << pointer.left if !pointer.left.nil?
      queue << pointer.right if !pointer.right.nil?
      @all << queue[0].root
      queue.shift
    end
    @all.shift
    @all
  end

  def inorder(pointer = @a, all = Array.new)
    return if pointer.nil?

    all << inorder(pointer.left)
    all << pointer.root
    all << inorder(pointer.right)

    all.compact
  end

  def preorder(pointer = @a, all = Array.new)
    return if pointer.nil?

    all << pointer.root
    all << preorder(pointer.left)
    all << preorder(pointer.right)

    all.compact
  end

  def postorder(pointer = @a, all = Array.new)
    return if pointer.nil?

    all << postorder(pointer.left)
    all << postorder(pointer.right)
    all << pointer.root

    all.compact
  end

  def height(node, count = 0)
    return -1 if node.nil?
    count += 1
    if height(node.left) > height(node.right)
      count += height(node.left)
    elsif height(node.right) > height(node.left)
      count += height(node.right)
    else
      count += height(node.left)
    end
    count
  end

  def depth(node, pointer = @a)
    count = 0
    return -1 if node == nil
    return count if pointer.root == node.root
    while pointer.root != node.root
      if pointer.root > node.root
        pointer = pointer.left
        count += 1
      end
      if node.root > pointer.root
        pointer = pointer.right
        count += 1
      end
      if node.root == pointer.root
        return count
      end
    end
  end
  
end

my_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(my_array)
tree.build_tree(tree.array, 0, tree.array.length - 1)
puts tree.depth(tree.root.right.right.right)
