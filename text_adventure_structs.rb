class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  Player = Struct.new(:name, :location)
  Room = Struct.new(:reference, :name, :description, :connections)

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

end










# my_dungeon = Dungeon.new("Tsar Todd")
# my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
# my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })
