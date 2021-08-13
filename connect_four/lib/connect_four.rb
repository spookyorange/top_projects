# frozen_string_literal: true

require './lib/board_elements'

class ConnectFour
  def initialize
    @board = Board.new
    @turn = 1
    @game_won = 0
  end

  def play_from_wide(input)
    wide = input
    if @board.wides[wide.to_s].check_h == 'error'
      puts "\n\nERROR: no more spot left in this wide try in a new spot\n\n"
      return
    end
    if @turn.odd?
      @board.wides[wide.to_s].play('r')
    else
      @board.wides[wide.to_s].play('g')
    end
    @turn += 1
    @last_played_wide = @board.wides[wide.to_s]
    @w = wide.to_i
    @h = (@board.wides[wide.to_s].h - 1)
    if @w + 3 <= 7 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w + 1}#{@h}"].got_by
      if @board.all_tiles["#{@w + 1}#{@h}"].got_by == @board.all_tiles["#{@w + 2}#{@h}"].got_by
        if @board.all_tiles["#{@w + 2}#{@h}"].got_by == @board.all_tiles["#{@w + 3}#{@h}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @w - 3 >= 1 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w - 1}#{@h}"].got_by
      if @board.all_tiles["#{@w - 1}#{@h}"].got_by == @board.all_tiles["#{@w - 2}#{@h}"].got_by
        if @board.all_tiles["#{@w - 2}#{@h}"].got_by == @board.all_tiles["#{@w - 3}#{@h}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h + 3 <= 6 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w}#{@h + 1}"].got_by
      if @board.all_tiles["#{@w}#{@h + 1}"].got_by == @board.all_tiles["#{@w}#{@h + 2}"].got_by
        if @board.all_tiles["#{@w}#{@h + 2}"].got_by == @board.all_tiles["#{@w}#{@h + 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h - 3 >= 1 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w}#{@h - 1}"].got_by
      if @board.all_tiles["#{@w}#{@h - 1}"].got_by == @board.all_tiles["#{@w}#{@h - 2}"].got_by
        if @board.all_tiles["#{@w}#{@h - 2}"].got_by == @board.all_tiles["#{@w}#{@h - 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h + 3 <= 6 && @w + 3 <= 7 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w + 1}#{@h + 1}"].got_by
      if @board.all_tiles["#{@w + 1}#{@h + 1}"].got_by == @board.all_tiles["#{@w + 2}#{@h + 2}"].got_by
        if @board.all_tiles["#{@w + 2}#{@h + 2}"].got_by == @board.all_tiles["#{@w + 3}#{@h + 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h - 3 >= 1 && @w - 3 >= 1 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w - 1}#{@h - 1}"].got_by
      if @board.all_tiles["#{@w - 1}#{@h - 1}"].got_by == @board.all_tiles["#{@w - 2}#{@h - 2}"].got_by
        if @board.all_tiles["#{@w - 2}#{@h - 2}"].got_by == @board.all_tiles["#{@w - 3}#{@h - 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h + 3 <= 6 && @w - 3 >= 1 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w - 1}#{@h + 1}"].got_by
      if @board.all_tiles["#{@w - 1}#{@h + 1}"].got_by == @board.all_tiles["#{@w - 2}#{@h + 2}"].got_by
        if @board.all_tiles["#{@w - 2}#{@h + 2}"].got_by == @board.all_tiles["#{@w - 3}#{@h + 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
    if @h - 3 >= 1 && @w + 3 <= 7 && @board.all_tiles["#{@w}#{@h}"].got_by == @board.all_tiles["#{@w + 1}#{@h - 1}"].got_by
      if @board.all_tiles["#{@w + 1}#{@h - 1}"].got_by == @board.all_tiles["#{@w + 2}#{@h - 2}"].got_by
        if @board.all_tiles["#{@w + 2}#{@h - 2}"].got_by == @board.all_tiles["#{@w + 3}#{@h - 3}"].got_by
          puts 'r won!' if @turn.even?
          puts 'g won!' if @turn.odd?
          @game_won = 1
        end
      end
    end
  end

  def show_board
    board_heights = Hash[@board.heights.to_a.reverse]
    board_heights.each do |akey, height|
      height.tiles.each do |bkey, a|
        print "#{a.got_by}\t"
      end
      print "\n"
    end
  end

  def play
    print "\n\nGAME STARTS\nplayer 1 = r\nplayer 2 = g\n\n"
    while @game_won == 0
      show_board
      input = 0
      print "\n\nenter an input 1 - 7\n\n"
      input = gets.chomp.to_i
      while input > 7 || input < 1
        print "\n\nplease enter a valid input 1 - 7\n\n"
        input = gets.chomp.to_i
      end
      play_from_wide(input)
    end
    print "\n\n"
    show_board
    print"\n\nGAME OVER\n\n"
  end
end

game = ConnectFour.new
game.play
