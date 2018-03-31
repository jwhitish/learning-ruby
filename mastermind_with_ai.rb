#!/usr/bin/ruby

#Copy of the game 'Mastermind' as an assignment for The Odin Project

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

  def codebreaker
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
  end

  def codemaker
    @player = "Computer"
    #get the code from the user
    @secretcode = prompt("Enter your secret code:\n").split
    puts "Code entered is:" + @secretcode.join(" ")
    @turn = 11
    while @turn < 13
      guessSecretCode
      checkCode(@aiguess)
      puts "For turn #{@turn.to_s}: The computer guessed #{@aiguess}. #{@color_match.to_s} colors are correct and #{@pos_match} positions are correct."
      @turn += 1
      sleep(1)
    end
    puts "Game Over: Computer is out of turns!"
  end

  def guessSecretCode #creates an array of 4 colors
    #computer guesses random colors
    #keep the colors that match exactly
    num_code = []
    colors = ["R", "O", "Y", "G", "B", "I", "V"]
    color_code = []
    4.times{num_code.push(rand(7))}
    for i in num_code
      color_code.push(colors[i])
    end
    #puts "\nDebug- Comp guess:" + color_code.join(",")
    @aiguess = color_code.join(",")
  end

  def checkCode(guess)
    if @code == guess
      abort("#{@player} Wins!")
    else
      #check for color and position
      @color_match = guess.count { |el| code.include?(el) }
      @pos_match = guess.zip(code).count { |a, b| a == b }
    end
  end

end


include Promptable
newgame = Game.new
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
  newgame.codebreaker
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
  newgame.codemaker
when "q"
  abort("Goodbye.")
end
