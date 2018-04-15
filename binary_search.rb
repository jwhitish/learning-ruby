
#check for duplicate processing

class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value = nil)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(ary)
    @tree = []
    ary.each_with_index do |item, index|
      if index == 0 #if first item, set to root
        @root = Node.new(ary[0])
        @tree << @root
      else
        node = Node.new(item)
        #refactor to handle an unsorted list that cannot be sorted
        #check if the item is <> root
        if node.value < @root.value
          #move left, check if nil
          if @root.left == nil
            @root.left = node
            node.parent = @root
            @tree << node
            puts "__Debug__: Left side!"
          else #not nil
            #repeat check and set routine
            puts "left not nil!"
          end
        else
          #move right, check if nil
          if @root.right == nil
            @root.right = node
            node.parent = @root
            @tree << node
            puts "__Debug__: Right side!"
          else #not nil
            #repeat check and set routine
            puts "right not nil!"
          end
        end
      end
    end
    puts "Root is: #{@root.value}"
    @tree.each { |item| puts "Value: #{item.value}\nParent: #{item.parent}\n\n"}

  end #end of build_tree

    #if nil, set root l/r to self, set parent to root, add to tree
    #if not, check l/r for that node, continue until hits nil
    #set parent and the parents l/r

end


data = [75, 1, 4, 23, 8, 11, 164, 3, 5, 7, 9, 67, 6345, 324]
sorted = data.sort!
sdata = [7, 2, 1, 8, 10]


new_tree = Tree.new
#new_tree.build_tree(sorted)
new_tree.build_tree(sdata)
