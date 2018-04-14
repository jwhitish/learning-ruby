
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
    update_links
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
    #weirdly outputting the object ref after the prints...
    if @list.length > 1
      @list.each do |item|
        if item == @list[-1]
          puts "( #{item.value} ) -> nil"
        else
          print "( #{item.value} ) -> "
        end
      end
    else
      puts "( #{@list[0].value} )"
    end
  end

  def insert_at(index, value)
    node = Node.new(value)
    @list.insert(index, node)
    update_links
  end

  def remove_at(index)
    @list.delete_at(index)
    update_links
  end

  def update_links
    @list.each_with_index do |node, index|
      node.next_node = @list[index + 1]
    end
  end

end


mylist = LinkedList.new

mylist.append("there")
mylist.prepend("hello")
mylist.append("bob")
# mylist.append("and sally")
# mylist.remove_at(1)
puts mylist.size

puts mylist.to_s
