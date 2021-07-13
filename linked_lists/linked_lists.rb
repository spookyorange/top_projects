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
    @tail = Node.new
    @head = Node.new(nil, @tail)
  end

  def append(value)
    if @head.value.nil?
      @head = Node.new(value, @tail)
    elsif @head.next_node.value.nil?
      @tail = Node.new(value, nil)
      @head.next_node = @tail
    else
      @new_tail = Node.new(value, nil)
      @tail.next_node = @new_tail
      @tail = @new_tail
    end
  end
  
  def prepend(value)
    if @head.value.nil?
      if @tail.value.nil?
        @head = Node.new(value)
      else
        @head = Node.new(value, @tail)
      end
    else
      @new_head = Node.new(value)
      @new_head.next_node = @head
      @head = @new_head
    end
  end

  def info
    until @head.nil?
      puts @head.value
      @head = @head.next_node
    end
  end
end

list = LinkedList.new
list.append('haha')
list.prepend('three')
list.prepend('two')
list.prepend('one')
list.info
