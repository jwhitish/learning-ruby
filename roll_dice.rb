class Die

  def initialize
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def cheat(num)
    if num > 0 && num < 6
      @numberShowing = num
    else
      puts "Please choose a number between 1-6."
    end
  end

end

puts Die.new.cheat(3)
