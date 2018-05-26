#gem install launchy
#require 'launchy'

def instructions
	puts "\n		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts "			   -- Instructions --\n\n"
	puts "Chess is played on a square board of eight rows denoted with numbers 1 to 8 \nand eight columns denoted with letters a to h.\n\nBy convention, the game pieces are divided into white and black sets, and the \nplayers are referred to as White and Black respectively. White pieces are \ndenoted with capital letters, black with lowercase letters. Each player begins \nthe game with 16 pieces of the specified color, which consist of one king, \none queen, two rooks, two bishops, two knights, and eight pawns laid out as \nfollows:\n\n"
	puts "8| r | n | b | q | k | b | n | r |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "7| p | p | p | p | p | p | p | p |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "6|   |   |   |   |   |   |   |   |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "5|   |   |   |   |   |   |   |   |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "4|   |   |   |   |   |   |   |   |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "3|   |   |   |   |   |   |   |   |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "2| P | P | P | P | P | P | P | P |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "1| R | N | B | Q | K | B | N | R |"
	puts "  --- --- --- --- --- --- --- --- "
	puts "   a   b   c   d   e   f   g   h\n\n"
	puts "The player with the white pieces always moves first. After the first move, \nplayers alternately move one piece per turn. Pieces are moved to either \nan unoccupied square or one occupied by an opponent's piece, which is captured \nand removed from play. All pieces capture by moving to the square that the \nopponent's piece occupies. A player may not make any move that would put or \nleave the player's own king under attack. A player cannot pass; at each turn \none must make a legal move. If the player to move has no legal move, the game \nis over; it is either a checkmate (a loss for the player with no legal moves) \nif the king is under attack, or a stalemate (a draw) if the king is not.\n\n\n"
	puts "Moves:\n\n"
	puts "K/k: The king may move one square in any direction as long as it does not \nput the king in check.\n\n"
	puts "Q/q: The queen combines the moves of the bishop and rook. She may move any \nnumber of squares vertically, horizontally, or diagonally, but she may not \nleap over an occupied square.\n\n"
	puts "B/b: The bishop may move any number of squares diagonally, but may not leap \nover an occupied square.\n\n"
	puts "N/n: The knight moves in an L shape by either moving two spaces vertically \nand one horizontally, or one vertically and two horizontally. The knight is \nthe only piece that may leap over occupied squares.\n\n"
	puts "R/r: The rook may move any number of spaces vertically or horizontally, but \nmay not leap over an occupied square.\n\n"
	puts "P/p: The pawn may move two spaces directly ahead on it's first turn, or one \nspace directly ahead on any other turn. It cannot move backwards, horizontally, \nor diagonally. One exception is that the pawn may move diagonally one square \nto capture another player's piece. When a pawn advances to the opposite end of \nthe board, as a part of the move it is promoted and must be exchanged for the \nplayer's choice of queen, rook, bishop, or knight of the same color.\n\n\n"
	puts "Check: \n\n"
	puts "When a king is under immediate attack by one or two of the opponent's pieces, \nit is said to be in check. A response to a check is a legal move if it results \nin a position where the king is no longer under direct attack (that is, not in \ncheck). This can involve capturing the checking piece, interposing a piece \nbetween the checking piece and the king, or moving the king to a square where \nit is not under attack.\n\n\n"
	puts "End Game:\n\n"
	puts "Games can be won in the following ways:\nCheckmate- The player whose turn it is to move is in check and has no legal \nmove to escape check.\nResignation- Either player may resign, conceding the game to the opponent. \nIt is usually considered poor etiquette to play on in a truly hopeless position.\nStalemate- The player whose turn it is to move has no legal move and is not\n in check.\nDraw- Draws are most commonly reached by mutual agreement between the players.\n\n\n"
	puts "How to Move:\n\n"
	puts "When prompted to make a move, enter the two coordinates that denote the origin \nsquare and the destination square. For example, if you want to move the pawn \nin square a2 to square a3, enter 'a2,a3' into the prompt without any spaces. \nIf the destination square is a legal move, the piece will move to that square. \nIf the destination square is occupied and the move is a legal capture, the \npiece will be captured and your piece will now occupy that square.\n\n"

	more_info = prompt
	if more_info == 'y'
		#Launchy.open("https://en.wikipedia.org/wiki/Chess")
	end
end

def prompt(message = 'Learn more? (y/n)', symbol = ':> ')
        puts message
        print symbol
        gets.chomp
end

instructions