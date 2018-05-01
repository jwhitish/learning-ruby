
class Game

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
        self.display_board
        #turn
      when "2"
        abort("Goodbye!\n")
    end
  end

  def init_board
    @the_board = [[" "," "," "," "," "," "," "],
    [" "," "," "," "," "," "," "],
    [" "," "," "," "," "," "," "],
    [" "," "," "," "," "," "," "],
    [" "," "," "," "," "," "," "],
    [" "," "," "," "," "," "," "],]
  end

  def display_board
    puts "                                1 2 3 4 5 6 7"
    @the_board.each do |i|
      puts "                               |" + i.join("|") + "|"
    end
  end

  def turn
    #prompt for user input on column to select
    #add user choice to game board in correct column and row ( /U+26AA and /U+26AB )
    #check for winner
    #computer's turn, check for winner
    #loop until won or no moves left
  end

  def winner?
    #check for winner
    #if yes, announce then return to menu
  end

end #class end

my_game = Game.new
my_game.welcome
