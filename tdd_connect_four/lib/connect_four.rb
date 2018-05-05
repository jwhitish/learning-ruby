
class Game
  attr_accessor :white, :black, :player
  def initialize
    @the_board = Array.new
  end

  def prompt(message = 'Enter your choice:', symbol = ':> ' )
    puts message
    print symbol
    gets.chomp
  end

  def welcome
    puts "                        +++ Welcome to Connect Four! +++
                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                      Players will take turns placing tiles
                      The first to connect four tiles wins!
                      Type 'menu' at any time to return to
                      the main menu.\n\n"
    self.menu
  end

  def menu
    choice = prompt("Please select an option:\n\n1) New Game\n2) Quit")
    case choice
      when "1"
        self.init_board
        self.turn
        #turn
      when "2"
        abort("Goodbye!\n")
    end
  end

  def init_board
    @the_board = [["  ","  ","  ","  ","  ","  ","  "],
    ["  ","  ","  ","  ","  ","  ","  "],
    ["  ","  ","  ","  ","  ","  ","  "],
    ["  ","  ","  ","  ","  ","  ","  "],
    ["  ","  ","  ","  ","  ","  ","  "],
    ["  ","  ","  ","  ","  ","  ","  "]]
  end

  def display_board
    puts "                                 1  2  3  4  5  6  7"
    @the_board.each do |i|
      puts "                               |" + i.join("|") + "|"
    end
  end

  def turn #2 player
    @w_tile = "\u26aa".encode('utf-8')
    @b_tile = "\u26ab".encode('utf-8')
    player = white
    tile = @w_tile

    until game_over?
      self.display_board
      column = prompt("Choose a column to drop your tile in:")
      if column == "menu"
        self.menu
      else
        if @the_board[5][column.to_i - 1] == "  "
          @the_board[5][column.to_i - 1] = tile
        elsif @the_board[4][column.to_i - 1] == "  "
          @the_board[4][column.to_i - 1] = tile
        elsif @the_board[3][column.to_i - 1] == "  "
          @the_board[3][column.to_i - 1] = tile
        elsif @the_board[2][column.to_i - 1] == "  "
          @the_board[2][column.to_i - 1] = tile
        elsif @the_board[1][column.to_i - 1] == "  "
          @the_board[1][column.to_i - 1] = tile
        elsif @the_board[0][column.to_i - 1] == "  "
          @the_board[0][column.to_i - 1] = tile
        else
          puts "Column is full"
          #restart without resetting the turn?
        end
      end
      #why is this stuck on black?
      if player == white
        player = black
        tile = @b_tile
        puts "switch black!"
      else
        player = white
        tile = @w_tile
        puts "switch white!"
      end
    end
  end

  def game_over?
    #check for winner
    if winner?
      abort("winner!")
    end

    #check for full board
    #if true, announce then return to menu
  end

  def winner?
    #checks horizontal winner
    queue = []
    @the_board.each do |x|
      x.each do |y|
        if queue.length <= 4
          queue.unshift(y)
          queue.all? {|z| z == queue[0]}
        else
          queue.pop
          queue.unshift(y)
          queue.all? {|z| z == queue[0]}
        end
      end
    end
    #check for vertical winner
    #check for diagonal winner
  end

end #class end

my_game = Game.new
my_game.welcome
