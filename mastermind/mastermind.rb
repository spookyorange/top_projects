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
    print "\nWelcome to Mastermind !
For instructions you can always take a look at mastermind_rules_and_documentation

4 pegs and 6 colors at total: r = red, g = green, b = blue, p = purple, y = yellow, o = orange

You need to guess the right colors at right pegs in 12 guesses
Take a guess by writing 4 values side by side like : gggg
! = Found
* = Have the color but place is wrong
o = Not included

"
    ins = gets.chomp
  else
    print "Please enter a valid value\n"
    ins = gets.chomp
  end
end

one_digit_colors = colors.map {|color| color.chars[0]}
balls = Array.new(4)
balls.map! {|ball| ball = one_digit_colors[rand(6)]}
last_balls = Array.new()
balls.each_with_index {|ball, i| last_balls[i] = Ball.new(ball, i)}
last_balls_colors = Array.new()
last_balls.each {|ball| last_balls_colors.unshift(ball.color)}


print "\nGame starts\n\n"
count = 0
while count < 12
  input = gets.chomp.chars
  input_value = Array.new()
  input.each_with_index {|color, i| input_value[i] = Ball.new(color, i)}
  input_value_colors = Array.new()
  input_value.each {|value| input_value_colors.unshift(value.color)}
  if (input.length == 4 && (input.all? {|color| one_digit_colors.include?(color)}))
    count += 1
    i = 0
    l = 0
    h = 0
    k = Array.new()
    instance_data = Array.new()
    instance_data_f = Array.new()
    while l < 4
      if ((input_value[l].color == last_balls[l].color) && (last_balls_colors.count(input_value[l].color) > instance_data_f.count(input_value[l].color)))
        instance_data_f.unshift(input_value[l].color)
        k.unshift("!")
        instance_data.unshift(input_value[l].color)
      end
      l += 1
    end
    while i < 4
      if ((input_value[i].color != last_balls[i].color) && (last_balls_colors.count(input_value[i].color) > instance_data.count(input_value[i].color)))
        k.unshift("*")
        instance_data.unshift(input_value[i].color)
      end
      i += 1
    end
    while h < 4
      if k.length <= 3
        k.unshift("o")
      end
      h += 1
    end
    if k == Array.new(4, "!")
      print "\n\nYou Win !"
      break 
    else
      print "#{k.sort}, #{12 - count} left\n"
    end
  else
    puts "enter a valid value"
  end
end

print "\n  answer was \n\n#{last_balls.map {|ball| ball.color}}\n\n"
