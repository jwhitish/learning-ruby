#!/usr/bin/ruby

#ideas to extend -
#make an easy mode with smaller words

class Hangman
  require "yaml"

  def initialize
    @word_file = File.open('../5desk.txt', 'r') { |file| file.read }
    valid_words = @word_file.split.select { |word| word.length.between?(5,12) }
    @word = valid_words[rand(valid_words.size)].scan(/\w/)
    @word = @word.each { |letter| letter.downcase! }
    @guesses = 6
    @already_guessed = []
    createGameBoard
  end

  # def mode
  #   input = prompt("Press 1 for easy mode, or 2 for regular mode.")
  #   case input
  #     when "1"
  #       valid_words = @word_file.split.select { |word| word.length.between?(4,6) }
  #       @word = valid_words[rand(valid_words.size)].scan(/\w/)
  #       puts @word
  #       createGameBoard
  #       puts "Easy mode activated!"
  #     when "2"
  #       #do nothing
  #   end
  # end

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
      puts "\n\nThe word was: " + @word.join.to_s
      puts "Out of guesses, Game Over!\n\n"
      self.menu
    else
      puts "\n\nYou have #{@guesses} misses remaining."
      puts "Misses: " + @already_guessed.join(",")
      puts "Word: " + @game_board.join(" ")
      @guess = prompt.downcase
      if @guess == "menu"
        self.menu
      elsif @guess == "hint"
        self.hint
      elsif @guess == "cheater"
        self.cheater
      elsif @word.join == @guess
        puts "Correct! The word was: " + @word.join
        puts "You win!\n\n"
        menu
      else
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
      end
      winner?
    end
  end

  def hint
    hint = @word[rand(@word.length - 1)]
    puts "Your hint is: " + hint.to_s
  end

  def cheater
    puts "The word is: " + @word.join
  end

  def winner?
    if @game_board == @word
      puts "The word was: " + @game_board.join.to_s
      puts "You win!\n\n"
      menu
    end
  end

  def menu
    menu_choice = prompt("Game Menu:\n1) Instructions\n2) Start a New Game\n3) Load a Saved Game\n4) Save Current Game\n5) Close Menu\nQ) Quit")
    case menu_choice
      when "1"
        self.instructions
      when "2"
        self.newGame
      when "3"
        self.loadGame
      when "4"
        self.saveGame
      when "5"
        self.playGame
      when "q"
        abort("Goodbye!")
    end
  end

  def newGame
    newgame = Hangman.new
    newgame.playGame

  end

  def welcome
    puts "\n\n                        ---- Welcome to Hangman! ----\n\n"
    puts "                Type 'menu' at any time to open the game menu.\n\n"
    self.menu
  end

  def instructions
    puts "Instructions: "
    puts "The computer will select a random word between 5 and 12 characters long. You will be shown the number of characters on a blank 'game board' and will guess the word one letter at a time. Each time you guess an incorrect letter, one 'miss' will be deducted from your balance until you reach zero.\n\nEach turn, you will be shown any incorrectly guessed letters, the 'game board' with all correct letters, and the 'misses' remaining. If you run out of 'misses', or if you guess the word correctly, the game is over.\n\nAt any time you can type 'menu' to return to the game menu, or guess the word by typing in the full word.\n\n"
    self.menu
  end

  def playGame
    until self.winner? || @guesses < 0
      self.turn
    end
  end

  def saveGame
    fileName = prompt("Name your saved game:").downcase + ".yml"
    fileName = fileName.gsub(/\s/, "_")
    save_file = YAML.dump({
      word: @word,
      guesses: @guesses,
      already_guessed: @already_guessed,
      game_board: @game_board
      })
      File.open("../saved_games/#{fileName}", 'w') { |f| f.write save_file}
    puts "\n\nGame Saved!\n\n"
    menu
  end

  def displayGames
    puts "Current saved games: "
    files = Dir.entries("../saved_games")
    puts files[2..files.length].join(" | ")
  end

  def loadGame
    displayGames
    fileName = prompt("\nEnter the name of your saved game:").downcase + ".yml"
    fileName = fileName.gsub(/\s/, "_")
    if File.exist?("../saved_games/#{fileName}")
      file = YAML.load_file("../saved_games/#{fileName}")
      @word = file[:word]
      @guesses = file[:guesses]
      @already_guessed = file[:already_guessed]
      @game_board = file[:game_board]
      playGame
    else
      puts "No game found with that name.\n\n"
      menu
    end
  end

end

newgame = Hangman.new
newgame.welcome
