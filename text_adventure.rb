class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end

    def location
      @location
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(referece, name, description, connections)
      @reference = referece
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end
  end

end

module Promptable
  def prompt(message = 'What would you like to do?', symbol = ':> ')
    puts message
    print symbol
    gets.chomp
  end
end

module Menu
  def menu
    "What would you like to do?
    [1] Walk North
    [2] Walk East
    [3] Walk South
    [4] Walk West
    [Q] Quit"
  end

  def show
    menu
  end
end

#runs the program
if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promptable

  #Create the main dungeon object
  player = prompt("What is your name?")
  my_dungeon = Dungeon.new(player)
  puts "Welcome to the game #{player}. Let's begin."

  #Add rooms to the dungeon
  my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
  my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })

  #Start the dungeon by placing the player in the large cave
  my_dungeon.start(:largecave)

#put the while loop and menu here
  until ['q'].include?(user_input = prompt(show).downcase)
    case user_input
    when '1'
      begin
        my_dungeon.go(:north)
      rescue
        puts "It's a blank wall..."

      end
    when '2'
      begin
        my_dungeon.go(:east)
      rescue
        puts "It's a blank wall..."
      end
    when '3'
      begin
        my_dungeon.go(:south)
      rescue
        puts "It's a blank wall..."
      end
    when '4'
      begin
        my_dungeon.go(:west)
      rescue
        puts "It's a blank wall..."
      end
    else
      puts 'That is not an option, try again'
    end
  end

end
#try turning the preceding dungeon code into a truly interactive program by creating a loop that uses the gets method to retrieve instructions from the player and then to “go” wherever the player determines. You can use chomp to strip off the newline characters from the incoming text, and to_sym to convert strings into symbols for the go method.
