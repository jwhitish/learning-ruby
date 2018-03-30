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
  attr_accessor :guess

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

  def play
    @turn = 1
    while @turn < 13
      @guess = prompt("Turn #{@turn.to_s}. Enter your guess:")
      @guess_arry = []
      unless @guess.include?("q")
        @guess_arry = @guess.split(",")
        puts @guess_arry.join(" ")
        #check for position
        checkCode(@guess_arry)
        puts "For turn #{@turn.to_s}, #{@color_match.to_s} colors are correct and #{} positions are correct."
        @turn += 1
      end
    end
  end

  def checkCode(guess)
    if @code == guess
      abort("You win!")
    else
      #check for color and position
      guess.each do |i|
        if @code.include?(i)
          @color_match += 1
        end
      end
    end
  end

end



  newgame = Game.new
  puts "The computer has selected a secret code of four colors, you have 12 guesses to find the correct combination."
  sleep(0.5)
  puts "Each turn the computer will tell you how many colors match the code and how many are in the correct position."
  sleep(0.5)
  puts "Choices are: R, O, Y, G, B, I , V"
  sleep(0.5)
  puts "Enter choices as four capital letters separated by commas - no spaces. Ex: B,G,Y,V"
  sleep(0.5)
  puts "To exit the game at any time, press 'q'."
  sleep(0.5)
  newgame.play
