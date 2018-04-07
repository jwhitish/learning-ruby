#!/usr/bin/ruby

class Hangman
  require "yaml"

  def initialize
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
      if @guess == "menu"
        self.menu
      elsif @guess == "hint"
        self.hint
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
    puts hint
  end

  def winner?
    if @game_board == @word
      puts "The word was: " + @game_board.join.to_s
      abort("You win!")
    end
  end

  def menu
    menu_choice = prompt("Game Menu:\n1) Instructions\n2) Start a New Game\n3) Load a Saved Game\n4) Save Current Game\nq) Quit")
    case menu_choice
      when "1"
        self.instructions
      when "2"
        self.newGame
      when "3"
        self.loadGame
      when "4"
        self.saveGame
      when "q"
        abort("Goodbye!")
    end
  end

  def newGame
    newgame = Hangman.new
    newgame.playGame
  end

  def welcome
    puts "Welcome to Hangman!\n\n"
    self.menu
  end

  def instructions
    puts "Instructions: "
    puts "The computer will select a random word between 5 and 12 characters long. You will be shown the number of characters on a blank 'game board' and will guess the word one letter at a time. Each time you guess an incorrect letter, one 'miss' will be deducted from your balance until you reach zero.\n\nEach turn, you will be shown any incorrectly guessed letters, the 'game board' with all correct letters, and the 'misses' remaining. If you run out of 'misses', or if you guess the word correctly, the game is over.\n\nAt any time you can type 'menu' to return to the game menu.\n\n"
    self.menu
  end

  def playGame
    until self.winner? || @guesses < 0
      self.turn
    end
  end

  def saveGame #figure out saving issue
    fileName = prompt("Name your saved game:").downcase + ".txt"
    fileName = fileName.gsub(/\s/, "_")
    save_file = File.new("#{fileName}", "w")
    save_file.puts YAML::dump(self)
    save_file.close
    puts "\n\nGame Saved!\n\n"
    self.menu
  end

  def displayGames
    #show list of saved games
  end

  def loadGame
    fileName = prompt("Enter the name of your saved game:").downcase + ".yml"
    fileName = fileName.gsub(/\s/, "_")
    if File.exist?("#{fileName}")
      openGame = YAML.load_file("#{fileName}", "r+")
    end
    puts openGame
    #run the game
    # add a rescue for Errno::ENOENT
  end

end

newgame = Hangman.new
newgame.welcome

#other todo - make end of game display the menu instead of exiting
#fix file paths. put saved games in saved folder, script in app folder
#display saved games
#rescue clause for load game
