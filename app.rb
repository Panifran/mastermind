class Game
  @@secret_colors = []
  @@guess_colors = []
  @@array = ["yellow", "green", "red", "white"]
  @@result = []
 
  def instructions
    puts "Welcome to Mastermind!"
    puts "The creator will choose four random colors out of the following:"
    puts "yellow, green, red, white"
    puts "Duplicate colors are allowed."
    puts "The codebreaker will have 12 guesses to get the correct order and colors."
    puts "After each guess, the computer will give the player an output."
    puts "A 'c' means that the color and placement are correct."
    puts "A 'p' means the color is correct but the placement is incorrect."
    puts "An 'x' means that neither color or placment is correct."
    puts "The array the computer outputs is randomized."
    puts "That means, a 'c' in index 0 does not mean that the first color you guessed is correct."
    puts "Let's go!"
  end
  
  def secret_colors
    array_num = Array.new(4) {rand}
    i = 0
    while i < 4
      if array_num[i] < 0.2
        @@secret_colors.push("yellow")
      elsif array_num[i] < 0.4
        @@secret_colors.push("green")
      elsif array_num[i] < 0.6
        @@secret_colors.push("red")
      elsif array_num[i] < 1
        @@secret_colors.push("white")
      end
      i += 1
    end
    print @@secret_colors
  end

  def guess_color
    @@guess_colors = []
    while true
      puts "Please guess the 1 color:"
      color1 = gets.chomp
      if @@array.include?(color1)
        @@guess_colors.push(color1)
        break
      end
    end
      while true
        puts "Please guess the 2 color:"
        color2 = gets.chomp
        if @@array.include?(color2)
          @@guess_colors.push(color2)
          break
        end
      end
      while true
        puts "Please guess the 3 color:"
        color3 = gets.chomp
        if @@array.include?(color3)
          @@guess_colors.push(color3)
          break
        end
      end
      while true
        puts "Please guess the 4 color:"
        color4 = gets.chomp
        if @@array.include?(color4)
          @@guess_colors.push(color4)
          break
        end
      end
      @@guess_colors  
  end

  def check_values
    i = 0
    @@result = []
    print @@result
    while i < 4
      if @@secret_colors[i] == @@guess_colors[i]
        @@result[i] = "c"
      elsif @@secret_colors.include?(@@guess_colors[i])
        @@result[i] = "p"
      else
        @@result[i] = "x"
      end
      i += 1
      print @@result
    end
    
  end

  def play
    instructions
    print secret_colors
    i = 0
    while i < 3
      guess_color
      check_values
      end_game?
      if end_game?
        puts "GAME OVER, YOU WIN"
        break
      end
      i += 1
    end
    
  end

  def end_game?
    @@result == ["c", "c", "c", "c"]
  end
end

game = Game.new
game.play
