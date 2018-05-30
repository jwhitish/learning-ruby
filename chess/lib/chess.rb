#!/usr/bin/ruby
require './instructions.rb'
require './welcome.rb'

#Should check for check, checkmate, stalemate; prevent moving into the first two- not a legal move

#ASCII can be subbed in for tokens later
#Disregard castling, en passant, pawn promotion for first iteration. Can be added later.

#use an array to keep track of piece objects currently on the board that print_board can use to display the board?

class Board
  attr_accessor :turn_count
  require "yaml"

  def initialize
    @turn_count = 1
    @the_board = []
  end

  def build_board
    #construct the board and put pieces on it
    #white on bottom
  end

  def print_board
    #print out the current board in a nice format with row/co labeled
  end

  def prompt(message = 'Enter your move:', symbol = ':> ')
    puts message
    print symbol
    gets.chomp
  end

  def play_game
    until end_game?
      #Show the board
      print_board
      #Ask for a move
      #Use from/to notation for moves (b2,b4), need to translate to xy
      #Validate selected piece is the players to move, or that it exists at all
      #check for 'resign'/'draw' command
      #Validate the move
      #Commit
      #Advance turn counter
      @turn_count += 1
      #Start again
    end
  end

  def end_game?
    #check for checkmate, stalemate
  end

  def new_game
    #Start a new game
    newgame = Board.new
    nawgame.build_board
    newgame.play_game
  end

  def load_game
    display_games
    file_name = prompt("\nEnter the name of your saved game:").downcase + ".yml"
    file_name = file_name.gsub(/\s/, "_")
    if File.exist?("../saved_games/#{file_name}")
      file = YAML.load_file("../saved_games/#{file_name}")
      #@word = file[:word]
      #@guesses = file[:guesses]
      #@already_guessed = file[:already_guessed]
      #@game_board = file[:game_board]
      play_game
    else
      puts "No game found with that name.\n\n"
      menu
    end
  end

  def display_games
    puts "Current saved games: "
    files = Dir.entries("../saved_games")
    puts files[2..files.length].join(" | ")
  end

  def save_game
    file_name = prompt("Name your saved game:").downcase + ".yml"
    file_name = file_name.gsub(/\s/, "_")
    save_file = YAML.dump({
      #word: @word,
      #guesses: @guesses,
      #already_guessed: @already_guessed,
      #game_board: @game_board
      })
      File.open("../saved_games/#{file_name}", 'w') { |f| f.write save_file}
      puts "\n\nGame Saved!\n\n"
      menu
    end

    def menu
      menu_choice = prompt("Enter a Number:\n1) Instructions\n2) New Game\n3) Load Game\n4) Save Game\n 5) Quit")
      case menu_choice
      when '1'
        instructions
      when '2'
        new_game
      when '3'
        load_game
      when '4'
        save_game
      when '5'
        abort("Goodbye!")
      end
    end


  end #class end



#go back and add a restraint to keep pieces on the board

class Piece
  attr_reader :x, :y, :color, :legal_moves, :token

  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
  end
end #class end

class Pawn < Piece
  if @color == white
    @token = "P"
  else
    @token = "p"
  end

  def generate_moves
    candidates = []
    if color == :white
      if @turn_count < 3
        @candidates.push([@x, @y + 1]).push([@x, @y + 2])
      else
        @candidates.push([@x, @y + 1])
      end
    else
      if @turn_count < 3
        @candidates.push([@x, @y - 1]).push([@x, @y - 2])
      else
        @candidates.push([@x, @y - 1])
      end
    end
    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

class Rook < Piece
  if @color == white
    @token = "R"
  else
    @token = "r"
  end

  def generate_moves
    candidates = []

    candidates.push([@x, @y + 1]).push([@x, @y + 2]).push([@x, @y + 3]).push([@x, @y + 4]).push([@x, @y + 5]).push([@x, @y + 6]).push([@x, @y + 7])
    candidates.push([@x, @y - 1]).push([@x, @y - 2]).push([@x, @y - 3]).push([@x, @y - 4]).push([@x, @y - 5]).push([@x, @y - 6]).push([@x, @y - 7])
    candidates.push([@x + 1, @y]).push([@x + 2, @y]).push([@x + 3, @y]).push([@x + 4, @y]).push([@x + 5, @y]).push([@x + 6, @y]).push([@x + 7, @y])
    candidates.push([@x - 1, @y]).push([@x - 2, @y]).push([@x - 3, @y]).push([@x - 4, @y]).push([@x - 5, @y]).push([@x - 6, @y]).push([@x - 7, @y])

    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

class Knight < Piece
  if @color == white
    @token = "N"
  else
    @token = "n"
  end

  def generate_moves
    candidates = []

    candidates.push([@x + 2, @y - 1]).push([@x + 2, @y + 1]).push([@x + 1, @y - 2]).push([@x + 1, @y + 2]).push([@x - 1, @y - 2]).push([@x - 1, @y + 2]).push([@x - 2, @y - 1]).push([@x - 2, @y + 1])

    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

class Bishop < Piece
  if @color == white
    @token = "B"
  else
    @token = "b"
  end

  def generate_moves
    candidates =[]

    candidates.push([@x + 1, @y + 1]).push([@x + 2, @y + 2]).push([@x + 3, @y + 3]).push([@x + 4, @y + 4]).push([@x + 5, @y + 5]).push([@x + 6, @y + 6]).push([@x + 7, @y + 7])
    candidates.push([@x + 1, @y - 1]).push([@x + 2, @y - 2]).push([@x + 3, @y - 3]).push([@x + 4, @y - 4]).push([@x + 5, @y - 5]).push([@x + 6, @y - 6]).push([@x + 7, @y - 7])
    candidates.push([@x - 1, @y + 1]).push([@x - 2, @y + 2]).push([@x - 3, @y + 3]).push([@x - 4, @y + 4]).push([@x - 5, @y + 5]).push([@x - 6, @y + 6]).push([@x - 7, @y + 7])
    candidates.push([@x - 1, @y - 1]).push([@x - 2, @y - 2]).push([@x - 3, @y - 3]).push([@x - 4, @y - 4]).push([@x - 5, @y - 5]).push([@x - 6, @y - 6]).push([@x - 7, @y - 7])

    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

class Queen < Piece
  if @color == white
    @token = "Q"
  else
    @token = "q"
  end

  def generate_moves
    candidates = []

    candidates.push([@x, @y + 1]).push([@x, @y + 2]).push([@x, @y + 3]).push([@x, @y + 4]).push([@x, @y + 5]).push([@x, @y + 6]).push([@x, @y + 7])
    candidates.push([@x, @y - 1]).push([@x, @y - 2]).push([@x, @y - 3]).push([@x, @y - 4]).push([@x, @y - 5]).push([@x, @y - 6]).push([@x, @y - 7])
    candidates.push([@x + 1, @y]).push([@x + 2, @y]).push([@x + 3, @y]).push([@x + 4, @y]).push([@x + 5, @y]).push([@x + 6, @y]).push([@x + 7, @y])
    candidates.push([@x - 1, @y]).push([@x - 2, @y]).push([@x - 3, @y]).push([@x - 4, @y]).push([@x - 5, @y]).push([@x - 6, @y]).push([@x - 7, @y])
    candidates.push([@x + 1, @y + 1]).push([@x + 2, @y + 2]).push([@x + 3, @y + 3]).push([@x + 4, @y + 4]).push([@x + 5, @y + 5]).push([@x + 6, @y + 6]).push([@x + 7, @y + 7])
    candidates.push([@x + 1, @y - 1]).push([@x + 2, @y - 2]).push([@x + 3, @y - 3]).push([@x + 4, @y - 4]).push([@x + 5, @y - 5]).push([@x + 6, @y - 6]).push([@x + 7, @y - 7])
    candidates.push([@x - 1, @y + 1]).push([@x - 2, @y + 2]).push([@x - 3, @y + 3]).push([@x - 4, @y + 4]).push([@x - 5, @y + 5]).push([@x - 6, @y + 6]).push([@x - 7, @y + 7])
    candidates.push([@x - 1, @y - 1]).push([@x - 2, @y - 2]).push([@x - 3, @y - 3]).push([@x - 4, @y - 4]).push([@x - 5, @y - 5]).push([@x - 6, @y - 6]).push([@x - 7, @y - 7])

    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

class King < Piece
  if @color == white
    @token = "K"
  else
    @token = "k"
  end

  def generate_moves
    candidates = []

    candidates.push([@x, @y + 1]).push([@x, @y - 1]).push([@x + 1, @y]).push([@x - 1, @y]).push([@x + 1, @y + 1]).push([@x + 1, @y - 1]).push([@x - 1, @y + 1]).push([@x - 1, @y - 1])

    @legal_moves = candidates.select{|cand| cand[0] >= 0 && cand[0] <= 7 && cand[1] >= 0 && cand[1] <= 7}
  end
end #class end

letsplay = Board.new
letsplay.print_welcome #contained in welcome.rb
