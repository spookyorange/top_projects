# frozen_string_literal: true

class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  attr_reader :value, :next_node
  attr_accessor :next_node
end

class LinkedList
  def initialize
    @end = Node.new
    @tail = Node.new(nil, @end)
    @head = Node.new(nil, @tail)
  end

  def append(value)
    if @tail.value.nil?
      @head = Node.new(value, @end)
      @tail = @head
    else
      @new_tail = Node.new(value, @end)
      @tail.next_node = @new_tail
      @tail = @new_tail
    end
  end
  
  def prepend(value)
    if @head.value.nil?
      @head = Node.new(value, @end)
    elsif @head.next_node == @end
      @tail = Node.new(value, @end)
      @head.next_node = @tail
    else
      @new_head = Node.new(value, @head)
      @head = @new_head
    end
  end

  def info
    until @head.nil?
      if @head == @end
        return
      else
        puts @head.value
        @head = @head.next_node
      end
    end
  end
end

list = LinkedList.new

list.append('y')
list.append('p')
list.prepend('a')
list.prepend('k')

list.prepend('1')
list.prepend('first')
list.append('last')

list.info
