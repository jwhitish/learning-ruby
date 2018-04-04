#!/usr/bin/ruby

class Hangman

  def initialize
    #load the dictionary and select a random word between 5-12 char long
    word_file = File.open('5desk.txt', 'r') { |file| file.read }
    valid_words = word_file.split.select { |word| word.length.between?(5,12) }
    @word = valid_words[rand(valid_words.size)].downcase.split(' ')
    @guesses = @word.join.length
    puts "__Debug__: the word is- " + @word.to_s
    puts "__Debug__: guesses are- " + @guesses.to_s
    createGameBoard
  end

  def prompt(message = 'Enter your guess:', symbol = ':> ')
    puts message
    print symbol
    gets.chomp
  end

  def createGameBoard
    @game_board = []
    @word.join.length.times { @game_board.push("_") }
    puts "__Debug__: game board-" + @game_board.join(" ")
  end

  def turn
    if @guesses == 0
      abort("Out of guesses, Game Over!")
    else
      #check for winner
      puts "You have #{@guesses} guesses remaining."
      already_guessed = []
      puts "Letters already guessed: " + already_guessed.join(",")
      puts "Word: " + @game_board.join(" ")
      @guess = prompt.downcase!
      if @word.include?(@guess)
        #find the index in @word
        #replace that index in @game_board with the guess
      else
        already_guessed.push(@guess)
      end
      @guesses -= 1
    end
  end

  def menu
    menu_choice = prompt("Game Menu:\n1) Start a New Game\n2) Load a Saved Game\n3) Save Current Game\n4) Quit")
    case menu_choice
      when "1"
        #start a new game
      when "2"
        #load a saved game
      when "3"
        #save the current game
      when "4"
        abort("Goodbye!")
    end
  end

end

mygame = Hangman.new
#mygame.menu
mygame.turn
