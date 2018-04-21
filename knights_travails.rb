class Node
  #occupied or unoccupied?
  #should have top, bottom, l, r connections
  #should have coordinate value
end

class Game
  attr_accessor #vars here

  def initialize
  end

  def create_board
    #create the game board (8x8)
    #squares are nodes
    #place the knight on the board
  end

  def print_board
    #prints out the board
  end

  def build_move_tree
    #builds the binary tree of all possible moves for the knight
  end

  def knight_moves(orig, dest)
    #create the knight object
    #Treat all possible moves the knight could make as children in a tree (there are a max of 8 from any given square)
    #Don’t allow any moves to go off the board.
    #Use BFS
    #Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square.
    #Output what that full path looks like
  end
end

my_game = Game.new
