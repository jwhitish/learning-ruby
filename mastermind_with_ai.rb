#!/usr/bin/ruby

#Copy of the game 'Mastermind' as an assignment for The Odin Project
#Improvements to be made: format users input to handle lowercase, finish the ai for codemaker, create an actual board to print?

module Promptable
  def prompt(message = 'Enter your guess:', symbol = ':> ')
    puts message
    print symbol
    gets.chomp
  end
end

class Game
  attr_reader :code
  attr_accessor :guess, :player

  include Promptable

  def initialize
    @code = generateSecretCode
  end

  def generateSecretCode #creates an array of 4 colors
    num_code = []
    colors = ["R", "O", "Y", "G", "B", "I", "V"]
    color_code = []
    4.times{num_code.push(rand(7))}
    for i in num_code
      color_code.push(colors[i])
    end
    #puts "\nSecret Code:" + color_code.join(" ")
    @code = color_code
  end

  def codeBreaker
    @player = "Player"
    @turn = 1
    while @turn < 13
      @guess = prompt("Turn #{@turn.to_s}. Enter your guess:")
      @guess_arry = []
      if @guess.include?("q")
        abort("Goodbye.")
      else
        @guess_arry = @guess.split(",")
        puts @guess_arry.join(" ")
        #check for position and color
        checkCode(@guess_arry)
        puts "For turn #{@turn.to_s}, #{@color_match.to_s} colors are correct and #{@pos_match} positions are correct."
        @turn += 1
      end
    end
    puts "Game Over: Out of turns!"
    playAgain
  end

  def codeMaker
    @player = "Computer"
    #get the code from the user
    @secretcode = prompt("Enter your secret code:\n").split(",")
    puts "Code entered is:" + @secretcode.join(" ")
    @turn = 1
    while @turn < 13
      guessSecretCode
      puts "For turn #{@turn.to_s}: The computer guessed #{@aiguess.join}. #{@color_match.to_s} colors are correct and #{@pos_match} positions are correct."
      @turn += 1
      sleep(1)
    end
    puts "Game Over: Computer is out of turns!"
    playAgain
  end

  def guessSecretCode #ai for codemaker mode
    #keep the colors that match exactly
    num_code = []
    @colors = ["R", "O", "Y", "G", "B", "I", "V"]
    color_code = []
    if @turn == 1
      4.times{num_code.push(rand(7))}
      for i in num_code
        color_code.push(@colors[i])
      end
      #puts "__Debug__ turn 1 color_code is: " + color_code.to_s
      @aiguess = color_code
    else
      #check for exact match in aiCheckCode
      #store the matches at their same locations in a new array
      #puts "__Debug__ before guess @aiguess is: " + @aiguess.to_s
      @match_ary = []
      @aiguess.zip(@secretcode).each do |a, b|
        if a == b
          @match_ary.push(a)
        # elsif @secretcode.include?(a)
        #   @match_ary.push(a)
        else
          #generate random new values for any non-match elements
          @match_ary.push(@colors[rand(7)])
          #still to do-
          #include correct colors in next guess if wrong position
          #make sure that element is in the next guess
        end
      end
      @aiguess = @match_ary
      #puts "__Debug__ after guess @aiguess is: " + @aiguess.to_s
    end
    aiCheckCode(@aiguess)
  end

  def aiCheckCode(guess) #checks the guess for codemaker mode
    if @secretcode == guess
      abort("For turn #{@turn.to_s}: The computer guessed #{@aiguess.join}. #{@player} wins!")
      playAgain
    else
      #check for color and position
      #puts "__Debug__: " + guess.join
      @color_match = guess.count { |el| @secretcode.include?(el) }
      @pos_match = guess.zip(@secretcode).count { |a, b| a == b }
    end
  end

  def checkCode(guess) #checks the guess for codebreaker mode
    if @code == guess
      abort("#{@player} Wins!")
      playAgain
    else
      #check for color and position
      @color_match = guess.count { |el| code.include?(el) }
      @pos_match = guess.zip(code).count { |a, b| a == b }
    end
  end

  def playAgain
    response = prompt("Do you want to play again? (y/n)")
    case response
    when "y"
      startGame
    when "n"
      puts "Good game!"
      exit
    end
  end

  def startGame
    puts "      __  __            _                     _           _
     |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
     | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
     |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
    puts "_____________________________________________________\n\n"
    sleep(1)
    choice = prompt("Do you want to be the: \n(1) Codebreaker\n(2) Codemaker\n(q) Quit")
    case choice
    when "1"
      puts "The computer has selected a secret code of four colors, you have 12 guesses to find the correct combination.\n\n"
      sleep(0.5)
      puts "Each turn the computer will tell you how many colors match the code and how many are in the correct position.\n\n"
      sleep(0.5)
      puts "Choices are: R, O, Y, G, B, I, V\n\n"
      sleep(0.5)
      puts "Enter choices as four capital letters separated by commas - no spaces. Ex: B,G,Y,V\n\n"
      sleep(0.5)
      puts "To exit the game at any time, press 'q'.\n\n"
      sleep(0.5)
      codeBreaker
    when "2"
      puts "The computer will get 12 turns to guess a secret code that you choose.\n\n"
      sleep(0.5)
      puts "Each turn, the computers guesses will be displayed and evaluated for both color and position.\n\n"
      sleep(0.5)
      puts "Choices are: R, O, Y, G, B, I, V\n\n"
      sleep(0.5)
      puts "Enter choices as four capital letters separated by commas - no spaces. Ex: B,G,Y,V\n\n"
      sleep(0.5)
      puts "To exit the game at any time, press 'q'.\n\n"
      sleep(0.5)
      codeMaker
    when "q"
      abort("Goodbye.")
    end
  end

end



newgame = Game.new
newgame.startGame
