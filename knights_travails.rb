class Square
  attr_reader :x, :y, :parent_obj, :children

  def initialize(x, y, parent_obj = nil)
    @x = x
    @y = y
    @parent_obj = parent_obj
    @children = []
  end

  def make_children

  end
end



my_game = Game.new
