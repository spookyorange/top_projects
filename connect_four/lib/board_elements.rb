# frozen_string_literal: true

class Tile
  attr_reader :got_by

  def initialize(w, h)
    @w = w
    @h = h
    @got_by = '0'
  end

  def occupy(got_by)
    @got_by = got_by
  end
end

class Height
  attr_reader :tiles

  def initialize(h)
    @h = h
    @tiles = {}
  end
end

class Wide
  attr_reader :tiles, :last_played, :h

  def initialize(w)
    @w = w
    @tiles = {}
    (1..6).each do |h|
      @tiles["#{w}#{h}"] = Tile.new(w, h)
    end
    @h = 1
  end

  def play(by)
    @tiles["#{@w}#{@h}"].occupy(by)
    @last_played_tile = @tiles["#{@w}#{@h}"]
    @h += 1
  end

  def check_h
    return 'error' if @h > 6
  end
end

class Board
  attr_reader :wides, :heights, :all_tiles

  def initialize
    @all_tiles = {}
    @wides = {}
    @heights = {}
    (1..6).each do |h|
      @heights[h.to_s] = Height.new(h)
    end
    (1..7).each do |w|
      @wides[w.to_s] = Wide.new(w)
      (1..6).each do |h|
        @all_tiles["#{w}#{h}"] = @wides[w.to_s].tiles["#{w}#{h}"]
        @heights[h.to_s].tiles["#{w}#{h}"] = @wides[w.to_s].tiles["#{w}#{h}"]
      end
    end
  end
end
