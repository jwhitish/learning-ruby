class Dungeon
  attr_accessor :player, :room

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
    if find_room_in_direction(direction) == nil
      puts "It's a blank wall..."
    else
      @player.location = find_room_in_direction(direction)
    end
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
  my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :north => :longcorridor, :east => :largecave })
  my_dungeon.add_room(:longcorridor, "Long Corridor", "a long, dark corridor running East to West", {:south => :smallcave })

  #Start the dungeon by placing the player in the large cave
  my_dungeon.start(:largecave)

#put the while loop and menu here
  until ['q'].include?(user_input = prompt(show).downcase)
    case user_input
    when '1'
        my_dungeon.go(:north)
    when '2'
        my_dungeon.go(:east)
    when '3'
        my_dungeon.go(:south)
    when '4'
        my_dungeon.go(:west)
    else
      puts 'That is not an option, try again'
    end
  end

end
