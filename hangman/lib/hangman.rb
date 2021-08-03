selectable = Array.new

words = File.readlines('5desk.txt')
words.each do |word|
  if (word.chars.length > 6)
    if (word.chars.length < 13)
      selectable.unshift(word)
    end
  end
end

 
class Hangman
  attr_reader :word, :guess_board, :misses, :won
  def initialize(word, misses=Array.new(), guess_board=Array.new(word.chars.length - 2, ' _ '))
    @word = word.downcase
    @misses = misses
    @guess_board = guess_board
    @won = 0
  end
  def show_word
    print "\n\n#{@guess_board.join("")}\n\n"
    print "\n\n#{@misses}\n\n"
  end
  def guess(char)
    word_chars = self.word.downcase.chars
    char.downcase!
    if char == 'save'
      Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
      print "\n\n\nname of the save file:\n"
      File.open("saved_games/#{gets.chomp}", 'w') do |file|
        data = Hash.new
        data[:word] = @word
        data[:misses] = @misses
        data[:guess_board] = @guess_board
        file.puts data
      end
    elsif ((char.chars.length < 1) || (char.ord < 97) || (char.ord > 122) || (char.chars.length > 1) || (@misses.count(char) > 0))
      print "\n\nEnter a valid input\n\n"
    else
      if word_chars.count(char) > 0
        word_chars.each_with_index do |character, index|
          if word_chars[index] == char
            @guess_board[index] = char
          end
        end
      else
        @misses.unshift(char)
      end
      print "\n\nGuess Board : #{@guess_board.join("")}\n\n"
      print "\n\nMisses : #{@misses}\n\n"
      if @guess_board.count(' _ ') == 0
        @won = true
      end
    end
  end
end

print "\n\nPlease type 'new' to start a new game or 'load' to load a saved game:\n\n"
ask = gets.chomp
value = 0
while value == 0
  if ask == 'new'
    new_game = Hangman.new(selectable[rand(selectable.length - 1)])
    value = 1
  elsif ask == 'load'
    saved_dir = "saved_games"
    saved_games = Dir.new(saved_dir).entries
    print "\n\nPlease enter the name of the load file you desire to continue from\n\n"
    print "#{saved_games[2..-1]}\n\n"
    filename = gets.chomp
    data = File.open("saved_games/#{filename}")
    saved_data = data.read
    saved_data = eval(saved_data)
    new_game = Hangman.new(saved_data[:word], saved_data[:misses], saved_data[:guess_board])
    value = 1
  else
    print "\n\nEnter a valid value: new / load\n\n"
    value = 0
    ask = gets.chomp
  end
end

new_game.show_word
while new_game.misses.length < 6
  case new_game.misses.length
    when 0
      hangman = "
            -------
            |     |
                  |
                  |
                  |
                  |
                  |
      -------------"
    when 1
        hangman = "
            -------
            |     |
            O     |
                  |
                  |
                  |
                  |
      -------------"
    when 2
          hangman = "
            -------
            |     |
            O     |
            |     |
            |     |
                  |
                  |
      -------------"
    when 3
          hangman = "
            -------
            |     |
            O     |
         ---|     |
            |     |
                  |
                  |
      -------------"
    when 4
          hangman = "
            -------
            |     |
            O     |
         ---|---  |
            |     |
                  |
                  |
      -------------"
    when 5
            hangman = "
            -------
            |     |
            O     |
         ---|---  |
            |     |
          __|     |
                  |
      -------------"
    when 6
              hangman = "
            -------
            |     |
            O     |
         ---|---  |
            |     |
          __|__   |
                  |
      -------------"
    else
      hangman = "haha"
    end
  if new_game.won == true
    print "\n\nGood Job\n\nThe word was: #{new_game.word}\n\n"
    break
  else
    puts hangman
    new_game.guess(gets.chomp)
  end
end
if new_game.misses.length == 6
                hangman = "
            -------
            |     |
            O     |
         ---|---  |
            |     |
          __|__   |
                  |
      -------------"
      puts hangman
      print "\n\nyou lost\n\nThe word was: #{new_game.word}\n\n"
end
