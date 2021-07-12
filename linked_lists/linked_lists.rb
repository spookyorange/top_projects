class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
    @@ref += 1
    @ref = @@ref
  end

  def self.ref
    @@ref
  end
  @@ref = 0
  attr_reader :value, :next_node, :ref
end

class LinkedList
  def initialize
    @length = 1
    @tail = Node.new(nil, nil)
  end

  def append(value)
    @a = Node.new(value, @tail)
  end
  
  def tri_ref
    @tail.ref
    @a.ref
  end
end

list = LinkedList.new
list.append('hah')
puts list
puts list.tri_ref