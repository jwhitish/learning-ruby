
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

class LinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def append(value)
    node = Node.new(value)
    @list.push(node)
    @list[-2].next_node = @list[-1] unless @list.length == 1
  end

  def prepend(value)
    node = Node.new(value)
    @list.unshift(node)
    #update all following node links
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains?(data)
    @list.each do |node|
      if data == node.value
        return true
      else
        return false
      end
    end
  end

  def find(data)
    @list.each_with_index do |item, index|
      if data == item.value
        return index
      else
        return nil
      end
    end
  end

  def to_s
    #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
    if @list.length > 1
      @list.each do |item|
        if item == @list[-1]
          print "( #{item.value} ) -> nil"
        else
          print "( #{item.value} ) -> "
        end
      end
    else
      puts "( #{@list[0].value} )"
    end
  end

  def insert_at(index)
    #insert_at(index) that inserts the node at the given index
    #update all node links
  end

  def remove_at(index)
    #remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
  end

end


mylist = LinkedList.new

mylist.append("there")
mylist.prepend("hello")
mylist.append("bob")
mylist.append("and sally")
puts mylist.size
puts mylist.head.value
puts mylist.to_s
