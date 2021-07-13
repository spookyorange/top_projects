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
    @size = 0
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
    @size += 1
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
    @size += 1
  end

  def size
    puts @size
  end

  def head
    puts @head.value
  end

  def tail
    puts @tail.value
  end

  def at(index)
    i = 0
    while i < index
      @pointer = @head.next_node
      i += 1
    end
    puts @pointer.value
  end

  def pop
    i = 0
    while i < (@size - 1)
      @pointer = @head.next_node
      i += 1
    end
    @end = @tail
    @end.next_node = nil
    @tail = @pointer
    @tail.next_node = @end
    @size -= 1
  end

  def contains(value)
    i = 0
    @pointer = @head
    while i < @size
      return true if @pointer.value == value

      @pointer = @pointer.next_node
      i += 1
    end
    false
  end

  def find(value)
    i = 0
    @pointer = @head
    while i < @size
      return i if @pointer.value == value

      @pointer = @pointer.next_node
      i += 1
    end
    false
  end

  def to_s
    i = 0
    @pointer = @head
    print "\n"
    while i < @size
      print "(#{@pointer.value}) => "
      @pointer = @pointer.next_node
      i += 1
    end
    print "\n"
  end

  def info
    @pointer = @head
    until @pointer.nil?
      if @pointer == @end
        return
      else
        puts @pointer.value
        @pointer = @pointer.next_node
      end
    end
  end
end
