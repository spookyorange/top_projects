class Player
    attr_reader :name, :symbol
    attr_accessor :won
    def initialize(name, symbol, won = 0)
        @name = name
        @symbol = symbol
        @won = won
    end
    def check()
        if @won == 1
            return true
        end
    end
end


board_elements = Hash.new()

for i in (1..10) do
    board_elements[i] = i
end


board = "    #{board_elements[1]}    |    #{board_elements[2]}    |    #{board_elements[3]}
    #{board_elements[4]}    |    #{board_elements[5]}    |    #{board_elements[6]}
    #{board_elements[7]}    |    #{board_elements[8]}    |    #{board_elements[9]}"


def play(board_elements, board, player)
    selected = 0
    while (board_elements[selected] == "x" || board_elements[selected] == "o" || selected < 1 || selected > 9)
        selected = gets.chomp.to_i
        if (selected < 1 || selected > 9)
            puts "please enter a valid value"
        elsif (board_elements[selected] == "x" || board_elements[selected] == "o")
            puts "area already been captured"
        end
    end
    board_elements[selected] = player.symbol
    board = "    #{board_elements[1]}    |    #{board_elements[2]}    |    #{board_elements[3]}
    #{board_elements[4]}    |    #{board_elements[5]}    |    #{board_elements[6]}
    #{board_elements[7]}    |    #{board_elements[8]}    |    #{board_elements[9]}"
    if (board_elements[1] == board_elements[4] && board_elements[4] == board_elements[7] ||
        board_elements[2] == board_elements[5] && board_elements[5] == board_elements[8] ||
        board_elements[3] == board_elements[6] && board_elements[6] == board_elements[9] ||
        board_elements[1] == board_elements[2] && board_elements[2] == board_elements[3] ||
        board_elements[4] == board_elements[5] && board_elements[5] == board_elements[6] ||
        board_elements[7] == board_elements[8] && board_elements[8] == board_elements[9] ||
        board_elements[1] == board_elements[5] && board_elements[5] == board_elements[9] ||
        board_elements[3] == board_elements[5] && board_elements[5] == board_elements[7])
        player.won = 1
    end
    puts board
end





puts("name of the player 1 =>")
player_1 = Player.new(gets.chomp, "x")
puts("player 1 is #{player_1.name}                      and is using #{player_1.symbol}")
puts("name of the player 2 =>")
player_2 = Player.new(gets.chomp, "o")
while player_2.name == player_1.name
    puts "try again"
    player_2 = Player.new(gets.chomp, "o")
end
puts("player 2 is #{player_2.name}                      and is using #{player_2.symbol}")
puts board

count = 0

while (player_1.won != 1 || player_2.won != 1)
    if ((count + 5) % 2 != 0)
        if player_1.check
            puts "#{player_1.name} won"
            break
        elsif player_2.check
            puts "#{player_2.name} won"
            break
        else
            play(board_elements, board, player_1)
            count += 1
        end
    elsif ((count + 5) % 2 == 0)
        if player_1.check
            puts "#{player_1.name} won"
            break
        elsif player_2.check
            puts "#{player_2.name} won"
            break
        else
            play(board_elements, board, player_2)
            count += 1
        end
    end
end