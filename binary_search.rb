
#does not currently handle duplicates

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
        @newNode = Node.new(item)
        if @newNode.value < @root.value
          #move left, check if nil
          if @root.left == nil
            @root.left = @newNode
            @newNode.parent = @root
            @tree << @newNode
          else #not nil
            check_node(@root.left)
          end
        else
          #move right, check if nil
          if @root.right == nil
            @root.right = @newNode
            @newNode.parent = @root
            @tree << @newNode
          else #not nil
            check_node(@root.right)
          end
        end
      end
    end
  end #end of build_tree

  def print_tree
    puts "Root is: #{@root.value}\n\n"

    @tree.each do |item|
      puts "Node: #{item}\n"
      puts "Value: #{item.value}\n"
      begin
        puts "Parent: #{item.parent.value}\n"
      rescue
        puts "Parent: nil\n"
      end
      begin
        puts "Left: #{item.left.value}\n"
      rescue
        puts "Left: nil\n"
      end
      begin
        puts "Right: #{item.right.value}\n\n"
      rescue
        puts "Right: nil\n\n"
      end
    end
  end

  def check_node(currentNode)
    if @newNode.value < currentNode.value
      if currentNode.left == nil
        currentNode.left = @newNode
        @newNode.parent = currentNode
        @tree << @newNode
      else #if not nil
        currentNode = currentNode.left
        check_node(currentNode)
      end
    else #if @newNode > currentNode
      if currentNode.right == nil
        currentNode.right = @newNode
        @newNode.parent = currentNode
        @tree << @newNode
      else #if not nil
        currentNode = currentNode.right
        check_node(currentNode)
      end
    end
  end

  def breadth_first_search(target)
    queue = [@tree[0]]
    while queue.length > 0
      if queue[0].value == target
        puts "Found target (#{target}) at node: #{queue[0]}"
        return queue[0]
        break
      else
        if queue[0].left != nil
          queue << queue[0].left
        end
        if queue[0].right != nil
          queue << queue[0].right
        end
        queue.shift
      end
    end #end of while
    puts "Target not found."
    return nil
  end

  def depth_first_search(target, currentNode)
    if currentNode.value == target
      puts "Found target (#{target}) at node: #{currentNode}\n\n"
      return
    else #if not
      if currentNode.left != nil
        depth_first_search(target, currentNode.left)
      end
      if currentNode.right != nil
        depth_first_search(target, currentNode.right)
      end
      if currentNode == @tree[-1]
        puts "Target (#{target}) not found.\n\n"
      end
    end
  end

end #end of Tree class


data = [75, 1, 4, 23, 8, 11, 164, 3, 5, 7, 9, 67, 6345, 324]
sorted = data.sort
sdata = [7, 8, 2, 1, 10]


new_tree = Tree.new
#new_tree.build_tree(sorted)
#new_tree.build_tree(sdata)
new_tree.build_tree(data)
#new_tree.print_tree
#new_tree.breadth_first_search(8)
new_tree.depth_first_search(32, new_tree.root)
new_tree.depth_first_search(8, new_tree.root)
#new_tree.depth_first_search(432, new_tree.root)
