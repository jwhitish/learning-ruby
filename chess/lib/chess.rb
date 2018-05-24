#Properly constrain moves to the legal board
#Write tests for pieces being checked often

#Initially use uppercase letters for white, lower for black. 
#ASCII can be subbed in through the print board method

#Use from/to chess notation for moves (b2, b4), can also use standard xy pairs. If chess notation, need to translate to xy 

#Disregard castling, en passant, pawn promotion for first iteration. Can be added later.

#Should check for check, checkmate, stalemate; prevent moving into the first two- not a legal move

#Validate selected piece is the players to move, or that it exists at all


Class Board
    def initialize
        @turn_count = 0
    end

    def prompt(message = 'Enter your guess:', symbol = ':> ')
        puts message
        print symbol
        gets.chomp
    end

    def turn
        Loop until end game conditions met
        Show the board
        Ask for a move
        Validate the move
        Commit
        Advance turn counter
        Start again
    end

    def welcome
        Print welcome message
    end

    def instructions
        #call instructions
    end

    def new_game
        #Start a new game
    end

    def load_game
        #load a saved game
    end

    def save_game
        #save the game & serialize to file
    end

    def menu
        menu_choice = prompt("Enter a Number:\n1) Instructions\n2) New Game\n3) Load Game\n4) Save Game\n 5) Quit")
        case menu_choice
            when '1'
                self.instructions
            when '2'
                self.new_game
            when '3'
                self.load_game
            when '4'
                self.save_game
            when '5'
                abort("Goodbye!")
        end
    end

end #class end




#Create one ‘piece’ class with general piece traits, 
#create subclasses for each type of piece that controls their unique moves
#One master ‘board’ class which will handle gameplay

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
