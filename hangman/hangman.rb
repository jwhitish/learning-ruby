#!/usr/bin/ruby

class Hangman

  def initialize
    #load the dictionary and select a random word between 5-12 char long
    word_file = File.open('5desk.txt', 'r') { |file| file.read }
    valid_words = word_file.split.select { |word| word.length.between?(5,12) }
    @word = valid_words[rand(valid_words.size)].scan(/\w/)
    @guesses = 6
    @already_guessed = []
    puts "__Debug__: the word is- " + @word.join
    createGameBoard
  end

  def prompt(message = 'Enter your guess:', symbol = ':> ')
    puts message
    print symbol
    gets.chomp
  end

  def createGameBoard
    @game_board = []
    @word.length.times { @game_board.push("_") }
  end

  def turn
    if @guesses == 0
      puts "The word was: " + @word.join.to_s
      abort("Out of guesses, Game Over!")
    else
      puts "You have #{@guesses} misses remaining."
      puts "Misses: " + @already_guessed.join(",")
      puts "Word: " + @game_board.join(" ")
      @guess = prompt.downcase
      if @word.include?(@guess)
        index = 0
        @word.each do |letter| #still not downcasing
          if letter == @guess
            @game_board[index] = letter
            index += 1
          else
            index += 1
          end
        end
      else
        @already_guessed.push(@guess)
        @guesses -= 1
      end
      winner? #check for winner
    end
  end

  def winner?
    if @game_board == @word
      puts "The word was: " + @game_board.join.to_s
      abort("You win!")
    end
  end

  def menu
    menu_choice = prompt("Game Menu:\n1) Instructions\n2) Start a New Game\n3) Load a Saved Game\n4) Save Current Game\n5) Quit")
    case menu_choice
      when "1"
        #puts the instructions
      when "2"
        self.playGame
      when "3"
        #load a saved game
      when "4"
        #save the current game
      when "5"
        abort("Goodbye!")
    end
  end

  def welcome
    #puts the welcome and instructions
    #enter something for the menu
    puts "Welcome to Hangman!"
    self.menu
  end

  def instructions
    #puts the instructions
  end

  def playGame
    #until winner or out of turns, execute 'turn'
    until self.winner? || @guesses < 0
      self.turn
    end
  end

  def saveGame
    #prompt for file name
    #save to file
    #exit the game
  end

  def loadGame
    #prompt for file name
    #load the game from file
    #run the game
  end

end

mygame = Hangman.new
mygame.welcome
