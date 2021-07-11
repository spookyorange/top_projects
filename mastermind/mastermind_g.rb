colors = ["red", "green", "blue", "purple", "yellow", "orange"]
class Ball
  attr_reader :color, :peg
  def initialize(color, peg)
    @color = color
    @peg = peg
  end
end

print "type help to get help, type start to start\n\n"
ins = gets.chomp
while ins.downcase != "start"
  if ins == "help"
    print "\nWelcome to Mastermind G !
For instructions you can always take a look at mastermind_rules_and_documentation

4 pegs and 6 colors at total: r = red, g = green, b = blue, p = purple, y = yellow, o = orange

Think about 4 colors randomly and type them in to a text editor or write to just a paper
The computer will take a guess by writing 4 values side by side like : ['g' 'g' 'g' 'g']
Tell computer if the guesses are correct like: '!!o!' (=> which means right right wrong right)
Computer keeps guessing until all 4 are correct (!!!!)
! = Correct
o = Incorrect

"
    ins = gets.chomp
  else
    print "Please enter a valid value\n"
    ins = gets.chomp
  end
end

one_digit_colors = colors.map {|color| color.chars[0]}

guesses = Array.new(4)
guess = guesses.each_with_index.map {|guess, i| guesses[i] = Ball.new(one_digit_colors[rand(6)], i)}
guess_colors = guess.map {|guess| guess.color}
print "\n#{guess_colors}\n\n"
player_info = gets.chomp.chars
while ((player_info.count("!") + player_info.count("o") != 4) || (player_info.length != 4))
  print "\n Please enter a valid input\n\n"
  player_info = gets.chomp.chars
end
result = Array.new(4)
player_info.each_with_index do |info, i|
  if (info == "!")
    result[i] = "right"
  else
    result[i] = "wrong"
  end
end

count = 0
while (count < 11)
  if result.count("right") == 4
    print "\nyay, we made it\n\n"
    break
  else
    new_guess = Array.new(4)
    new_guess = result.each_with_index.map do |result ,i|
      if result == "right"
        new_guess[i] = guess[i]
      else
        new_guess[i] = Ball.new(one_digit_colors[rand(6)], i) 
      end
    end
    guess = new_guess
    print "\n#{new_guess.map {|gue| gue.color}}\n\n"
    player_info = ""
    player_info = gets.chomp.chars  
    while ((player_info.count("!") + player_info.count("o") != 4) || (player_info.length != 4))
      print "\nPlease enter a valid value\n\n"
      player_info = gets.chomp.chars
    end
    result = Array.new(4)
    player_info.each_with_index do |info, i|
      if (info == "!")
        result[i] = "right"
      else
        result[i] = "wrong"
      end
    end
  end
  count += 1
  if count == 11
    print "\n Lost \n"
  else
    print "\n#{11 - count} guesses to go\n"
  end
end