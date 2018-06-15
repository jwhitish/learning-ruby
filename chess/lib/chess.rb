#!/usr/bin/ruby
require './instructions.rb'

#NOT currently operational

#Should check for check, checkmate, stalemate; prevent moving into the first two- not a legal move

#ASCII can be subbed in for tokens later
#Disregard castling, en passant, pawn promotion for first iteration. Can be added later.


class Board
  attr_accessor :turn_count
  require "yaml"

  def initialize
    @turn_count = 1
    @the_board = []
  end

  def build_board
    #construct the board, pieces
    # add to @the_board
    @the_board[0][1] = Pawn.new(0,1,white)
    @the_board[1][1] = Pawn.new(1,1,white)
    @the_board[2][1] = Pawn.new(2,1,white)
    @the_board[3][1] = Pawn.new(3,1,white)
    @the_board[4][1] = Pawn.new(4,1,white)
    @the_board[5][1] = Pawn.new(5,1,white)
    @the_board[6][1] = Pawn.new(6,1,white)
    @the_board[7][1] = Pawn.new(7,1,white)
    @the_board[0][0] = Rook.new(0,0,white)
    @the_board[1][0] = Knight.new(1,0,white)
    @the_board[2][0] = Bishop.new(2,0,white)
    @the_board[3][0] = Queen.new(3,0,white)
    @the_board[4][0] = King.new(4,0,white)
    @the_board[5][0] = Bishop.new(5,0,white)
    @the_board[6][0] = Kight.new(6,0,white)
    @the_board[7][0] = Rook.new(7,0,white)
    @the_board[0][6] = Pawn.new(0,6,black)
    @the_board[1][6] = Pawn.new(1,6,black)
    @the_board[2][6] = Pawn.new(2,6,black)
    @the_board[3][6] = Pawn.new(3,6,black)
    @the_board[4][6] = Pawn.new(4,6,black)
    @the_board[5][6] = Pawn.new(5,6,black)
    @the_board[6][6] = Pawn.new(6,6,black)
    @the_board[7][6] = Pawn.new(7,6,black)
    @the_board[0][7] = Rook.new(0,7,black)
    @the_board[1][7] = Knight.new(1,7,black)
    @the_board[2][7] = Bishop.new(2,7,black)
    @the_board[3][7] = Queen.new(3,7,black)
    @the_board[4][7] = King.new(4,7,black)
    @the_board[5][7] = Bishop.new(5,7,black)
    @the_board[6][7] = Kight.new(6,7,black)
    @the_board[7][7] = Rook.new(7,7,black)
  end

  def print_board
    # add a rescue clause that prints two spaces in the event of a nil value
    puts "8| " + @the_board[0][0].token + " | " + @the_board[0][1].token + " | " + @the_board[0][2].token + " | " + @the_board[0][3].token + " | " + @the_board[0][4].token + " | " + @the_board[0][5].token + " | " + @the_board[0][6].token + " | " + @the_board[0][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "7| " + @the_board[1][0].token + " | " + @the_board[1][1].token + " | " + @the_board[1][2].token + " | " + @the_board[1][3].token + " | " + @the_board[1][4].token + " | " + @the_board[1][5].token + " | " + @the_board[1][6].token + " | " + @the_board[1][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "6| " + @the_board[2][0].token + " | " + @the_board[2][1].token + " | " + @the_board[2][2].token + " | " + @the_board[2][3].token + " | " + @the_board[2][4].token + " | " + @the_board[2][5].token + " | " + @the_board[2][6].token + " | " + @the_board[2][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "5| " + @the_board[3][0].token + " | " + @the_board[3][1].token + " | " + @the_board[3][2].token + " | " + @the_board[3][3].token + " | " + @the_board[3][4].token + " | " + @the_board[3][5].token + " | " + @the_board[3][6].token + " | " + @the_board[3][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "4| " + @the_board[4][0].token + " | " + @the_board[4][1].token + " | " + @the_board[4][2].token + " | " + @the_board[4][3].token + " | " + @the_board[4][4].token + " | " + @the_board[4][5].token + " | " + @the_board[4][6].token + " | " + @the_board[4][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "3| " + @the_board[5][0].token + " | " + @the_board[5][1].token + " | " + @the_board[5][2].token + " | " + @the_board[5][3].token + " | " + @the_board[5][4].token + " | " + @the_board[5][5].token + " | " + @the_board[5][6].token + " | " + @the_board[5][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "2| " + @the_board[6][0].token + " | " + @the_board[6][1].token + " | " + @the_board[6][2].token + " | " + @the_board[6][3].token + " | " + @the_board[6][4].token + " | " + @the_board[6][5].token + " | " + @the_board[6][6].token + " | " + @the_board[6][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "1| " + @the_board[7][0].token + " | " + @the_board[7][1].token + " | " + @the_board[7][2].token + " | " + @the_board[7][3].token + " | " + @the_board[7][4].token + " | " + @the_board[7][5].token + " | " + @the_board[7][6].token + " | " + @the_board[7][7].token + " |"
    puts "  --- --- --- --- --- --- --- --- "
    puts "   a   b   c   d   e   f   g   h\n\n"
  end

  def prompt(message = 'Enter your move:', symbol = ':> ') #done
    puts message
    print symbol
    gets.chomp
  end

  def print_welcome #done
  	puts '			      _                    '
  	puts '			     | |                   '
  	puts '			  ___| |__   ___  ___ ___  '
  	puts '			 / __|  _ \ / _ \/ __/ __| '
  	puts '			| (__| | | |  __/\__ \__ \ '
  	puts '			 \___|_| |_|\___||___/___/ '
  	puts '		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  	puts
  	puts "Chess is a two-player strategy board game played on a chessboard, a gameboard\n with 64 squares arranged in an 8×8 grid. Each player begins with 16 pieces: \none king, one queen, two rooks, two knights, two bishops, and eight pawns. \n\nThe objective is to checkmate the opponent's king by placing it under an \ninescapable threat of capture. To this end, a player's pieces are used to \nattack and capture the opponent's pieces. The game ends when one player \ncaptures the other player's King, there are no legal moves remaining, or \none player declares defeat.\n\n"
  	puts '		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts "On your turn, move by entering the origin and destination coordinates when \nprompted like this: a1a4. To declare a draw or resign the match, simply type 'draw' or \n'resign' when promped for a move. At any time you may type 'menu' to \nsee the menu options."
    puts '		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  	menu
  end

  def turn_color #done
    if @turn_count % 2 == 0
      @turn_color = "black"
    else
      @turn_color = "white"
    end
  end

  def translate_coords(input) #done
    cypher_hash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7 }
    x1 = cypher_hash[input[0]]
    y1 = input[1].to_i - 1
    x2 = cypher_hash[input[2]]
    y2 = input[3].to_i - 1
    @origin = @the_board[x1][y1]
    @target = @the_board[x2][y2]
  end

  def play_game
    until end_game?
      puts "Turn #{@turn_count}:"
      print_board
      move = prompt("#{turn_color}'s move: ").to_s
      non_coord_entry(move)
      translate_coords(move)
      if @origin == nil #check that selected piece exists
        puts "Piece does not exist."
      else
        if @origin.color != @turn_color #validate color of piece
          puts "Piece is not yours to move."
        else
          players_piece?
          #Validate the move, check its legal
          #Commit, update @the_board and piece coords
          @turn_count += 1
        end #if color
      end #if nil
    end
  end

  def players_piece?
    #check piece color
    #match to current turn % 2
    #return true/false
  end

  def non_coord_entry(move) #done
    case move
      when 'draw'
        puts "It's a Draw!\n\n"
        menu
      when 'resign'
        if @turn_color = "black"
          puts "Black resigns, White wins!"
          menu
        else
          puts "White resigns, Black wins!"
          menu
        end
      when 'menu'
        menu
    end
  end

  def end_game?
    #check for checkmate, stalemate
    return False
  end

  def new_game #done
    newgame = Board.new
    newgame.build_board
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

  def display_games #done
    puts "Current saved games: "
    files = Dir.entries("../saved_games")
    puts files[2..files.length].join(" | ")
    puts
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

    def menu #done
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
    if @color == :white
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
letsplay.print_welcome
