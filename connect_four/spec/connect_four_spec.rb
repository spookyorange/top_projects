# frozen_string_literal: true

require './lib/connect_four'

describe Tile do
  describe '#initialize' do
    subject(:tile) { described_class.new(1, 2) }
    context 'it has 2 values = w and h' do
      it 'has a value of w' do
        expect(tile.instance_variable_get(:@h)).to eq(2)
      end

      it 'has a value of h' do
        expect(tile.instance_variable_get(:@w)).to eq(1)
      end
    end
  end
  describe '#occupy' do
    subject(:tile) { described_class.new(1, 2) }
    context 'when it is occupied' do
      it 'gets occupied by red' do
        tile.occupy('r')
        expect(tile.instance_variable_get(:@got_by)).to eq('r')
      end
    end
  end
end

describe Wide do
  describe '#initialize' do
    subject(:wide) { described_class.new(1) }
    context 'it creates a width with w value' do
      it 'has a value of w' do
        expect(wide.instance_variable_get(:@w)).to eq(1)
      end
    end
    context 'it has sub-classes of tiles' do
      it 'has subclasses of tiles which are created while initialized' do
        expect(wide.instance_variable_get(:@tiles).size).to eq(6)
      end
      it "has tile named '14'" do
        expect(wide.instance_variable_get(:@tiles).include?('14')).to be(true)
      end
    end
  end
  describe '#play' do
    subject(:wide) { described_class.new(3) }
    context 'it occupies starting from bottom(1)' do
      it "tile 31 will be occupied by 'r'" do
        wide.play('r')
        expect(wide.instance_variable_get(:@tiles)['31'].instance_variable_get(:@got_by)).to eq('r')
      end
      it 'next one will get 1 more from bottom(2)' do
        wide.play('r')
        wide.play('g')
        expect(wide.instance_variable_get(:@tiles)['32'].instance_variable_get(:@got_by)).to eq('g')
      end
    end
  end
end

describe Board do
  describe '#initialize' do
    subject(:board) { described_class.new }
    context 'creates tiles' do
      it 'has a hash size of 42 tiles' do
        expect(board.instance_variable_get(:@all_tiles).size).to eq(42)
      end
      it 'has a tile named (w)3(h)2' do
        expect(board.instance_variable_get(:@all_tiles).include?('32')).to be(true)
      end
      it 'has a tile named 56' do
        expect(board.instance_variable_get(:@all_tiles).include?('56')).to be(true)
      end
      it 'tile named 56 has w of 5' do
        expect(board.instance_variable_get(:@all_tiles)['56'].instance_variable_get(:@w)).to eq(5)
      end
      it 'tile named 56 has h of 6' do
        expect(board.instance_variable_get(:@all_tiles)['56'].instance_variable_get(:@h)).to eq(6)
      end
    end
    context 'creates wides' do
      it 'has 7 wides' do
        expect(board.instance_variable_get(:@wides).size).to eq(7)
      end
      it 'has a wide named 5' do
        expect(board.instance_variable_get(:@wides).include?('5')).to be(true)
      end
    end
    context 'wide and tiles bound each other' do
      it 'has wides which has tiles which are same as tiles it has' do
        expect(board.instance_variable_get(:@wides)['5'].instance_variable_get(:@tiles)['56']).to eq(board.instance_variable_get(:@all_tiles)['56'])
      end
      it "wide tile and all tile same in '56'" do
        expect(board.instance_variable_get(:@wides)['5'].instance_variable_get(:@tiles)['56'].instance_variable_get(:@w)).to eq(board.instance_variable_get(:@all_tiles)['56'].instance_variable_get(:@w))
      end
    end
  end
end

describe ConnectFour do
  describe '#play_from_wide' do
    subject(:game) { described_class.new }
    context 'plays the game from a selected wide' do
      before do
        allow(game).to receive(:gets).and_return('5')
      end
      it 'plays with a (automatically) selected color and (hand)selected wide' do
        game.play_from_wide
        expect(game.instance_variable_get(:@board).instance_variable_get(:@all_tiles)['51'].instance_variable_get(:@got_by)).to eq('r')
      end
    end
    context 'plays game from same wide 2 times and 1 from normal' do
      before do
        allow(game).to receive(:gets).and_return('3', '2', '3')
      end
      it 'plays the game like in context' do
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        expect(game.instance_variable_get(:@board).instance_variable_get(:@all_tiles)['31'].instance_variable_get(:@got_by)).to eq('r')
        expect(game.instance_variable_get(:@board).instance_variable_get(:@all_tiles)['21'].instance_variable_get(:@got_by)).to eq('g')
        expect(game.instance_variable_get(:@board).instance_variable_get(:@all_tiles)['32'].instance_variable_get(:@got_by)).to eq('r')
      end
    end
    context 'gives error if i try to go height 7' do
      before do
        allow(game).to receive(:gets).and_return('4', '4', '4', '4', '4', '4', '4')
      end
      it "plays game for 7 times from exact same spot 6 will succeed and 6 is 'r' and 7 gives error" do
        expect(game).to receive(:puts).with("\n\nERROR: no more spot left in this wide try in a new spot\n\n").twice
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
      end
    end
  end

=begin



  COMMENTED DUE TO NOT WORKING PROPERLY
  WILL TEST IT WITH HAND

  WIDE 1 = DONE
  WIDE 2 = DONE
  HEIGHT 1 = DONE
  HEIGHT 2 = DONE
  CROSS 1 = DONE
  CROSS 2 = DONE
  CROSS 3 = DONE
  CROSS 4 = DONE





  describe '#check' do
    subject(:game) { described_class.new }
    context 'checks if a player won from height, if won game over(happens each turn)' do
      before do
        allow(game).to receive(:gets).and_return('3', '2', '3', '2', '3', '2', '3')
      end
      xit 'checks from height if a player won' do
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        expect(game).to receive(:puts).with('red won!')
      end
    end
    context 'checks if a player won from wide, if won game over(happens each turn)' do
      before do
        allow(game).to receive(:gets).and_return('2', '2', '3', '3', '4', '4', '5')
        allow(game).to receive(:puts).and_return('r won!')
      end
      it 'checks from wide if a player won' do
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        expect(STDOUT).to receive(:puts).with("r won!")
      end
    end
    context 'checks if a player won from cross(1), if won game over(happens each turn)' do
      before do
        allow(game).to receive(:gets).and_return('2', '3', '3', '4', '1', '4', '4', '5', '1', '5', '1', '5', '5')
      end
      xit 'checks from wide if a player won' do
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        game.play_from_wide
        expect(game).to receive(:puts).with('r won!')
      end
    end
  end
=end
end
