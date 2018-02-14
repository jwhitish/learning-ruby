class OrangeTree
  def initialize
    @years = 0
    @oranges = 0
    @height = 0
  end

  def height
    puts @height
  end

  def oneYearPasses
    if @years <= 10
      @years += 1
      @height += 1
      puts "A year has passed and the tree has grown taller. The tree is now #{@years} years old and is #{@height} units tall."
    else
      puts "Sadly the tree has grown too old and died."
    end
    if @years > 3
      @oranges = @years + rand(0..3)
    else
      @oranges = 0
    end
  end

  def countTheOranges
    puts "There are #{@oranges} oranges on your tree!"
  end

  def pickAnOrange
    if @oranges > 0
      puts "You pick an orange from the tree. It was delicious."
      @oranges -= 1
      puts "There are now #{@oranges} oranges on the tree."
    else
      puts "There are no more oranges this year."
    end
  end
end

tree = OrangeTree.new
tree.countTheOranges
tree.pickAnOrange
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.countTheOranges
tree.pickAnOrange
