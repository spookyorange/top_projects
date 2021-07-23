class Node
  attr_accessor :head, :position
  def initialize(position = nil, head = nil)
    @head = head
    @position = position
  end
end

class Knight
  attr_reader :position
  def initialize(position = [4, 4])
    @position = position
  end

  def moves(position = @position)
    @possible_moves = []
    @possible_moves << [position[0] + 2, position[1] + 1] if position[0] + 2 <= 8 && position[1] + 1 <= 8
    @possible_moves << [position[0] + 2, position[1] - 1] if position[0] + 2 <= 8 && position[1] - 1 >= 1
    @possible_moves << [position[0] - 2, position[1] + 1] if position[0] - 2 >= 1 && position[1] + 1 <= 8
    @possible_moves << [position[0] - 2, position[1] - 1] if position[0] + 2 >= 1 && position[1] - 1 >= 1
    @possible_moves << [position[0] + 1, position[1] + 2] if position[0] + 1 <= 8 && position[1] + 2 <= 8
    @possible_moves << [position[0] + 1, position[1] - 2] if position[0] + 1 <= 8 && position[1] - 2 >= 1
    @possible_moves << [position[0] - 1, position[1] + 2] if position[0] - 1 >= 1 && position[1] + 2 <= 8
    @possible_moves << [position[0] - 1, position[1] - 2] if position[0] - 1 >= 1 && position[1] - 2 >= 1
    @possible_moves
  end

  def knight_moves(start, close)
    @position = start
    @destination = close
    queue = []
    @god = Node.new(@position)
    moves(@god.position).each do |hah|
      hah = Node.new(hah, @god)
      queue << hah
    end

    while !queue.empty?
      if queue[0].position == @destination
        haha = queue[0]
        count = 0
        solved = []
        while !haha.head.nil?
          count += 1
          haha.position
          solved.unshift(haha.position)
          haha = haha.head
        end
        solved.unshift(haha.position)
        print "\n\nCan be done in #{count} moves!\n\n"
        solved.each do |t|
          print "#{t}\n"
        end
        print "\n"
        return
      end
      moves(queue[0].position).each do |hah|
        hah = Node.new(hah, queue[0])
        queue << hah
      end
      queue.shift
    end
  end
end


class Board
  attr_reader :tiles
  #8x8 tiles all non-functional
  def initialize
    @tiles = []
    for x in 1..8
      for y in 1..8
        @tiles << {x: x, y: x}
      end
    end
  end

end

board = Board.new
knight = Knight.new
print knight.knight_moves([3, 3], [4, 3])