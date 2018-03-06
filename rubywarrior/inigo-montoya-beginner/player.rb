#my commands for the bloc.io ruby warrior game
#completed through level 5, currently on 6
class Player

  def play_turn(warrior)
    @health = warrior.health

    if captives_rescued? == true
      if warrior.feel(:backwards).captive?
        warrior.rescue!(:backwards)
        @captives_rescued += 1
      else
        warrior.walk!(:backwards)
      end
    else
      if warrior.feel.captive?
        warrior.rescue!
      else
        forward(warrior)
      end
      @endhealth = warrior.health
    end
  end

  def captives_rescued?
    if @captives_rescued.nil?
      @captives_rescued = 0
    end
    if @captives_rescued > 0
      return true
    else
      return false
    end
  end


  def forward(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      if warrior.feel.empty?
        if @health < 20
          checkHealth
        else
          warrior.walk!
        end
      else
        warrior.attack!
      end
    end
  end

  def assessAndGo(warrior)
    if warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end

  def checkHealth(warrior)
    if @health < @endhealth
      assessAndGo(warrior)
    else
      warrior.rest!
    end
  end

end
