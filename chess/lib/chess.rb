#!/usr/bin/ruby
require './instructions.rb'
require './welcome.rb'

#Properly constrain moves to the legal board
#Disregard castling, en passant, pawn promotion for first iteration. Can be added later.
#Should check for check, checkmate, stalemate; prevent moving into the first two- not a legal move

#Initially use uppercase letters for white, lower for black. 
#ASCII can be subbed in through the print board method


Class Board
    require "yaml"

    def initialize
        @turn_count = 0
        @the_board = Hash.new(" ")
    end

    def build_board
        @the_board[]
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

    def print_board
    end

    def end_game?
        #check for checkmate, stalemate
    end

    def new_game
        #Start a new game
        newgame = Board.new
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



#Create one ‘piece’ class with general piece traits, 
#create subclasses for each type of piece that controls their unique moves

Class Piece
end

Class Pawn < Piece
end

Class Rook < Piece
end

Class Knight < Piece
end

Class Bishop < Piece
end

Class Queen < Piece
end

Class King < Piece
end

letsplay = Board.new
letsplay.print_welcome #contained in welcome.rb