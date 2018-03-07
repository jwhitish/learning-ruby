#my commands for the bloc.io ruby warrior game
#completed through level 8, currently on 9
class Player

  def play_turn(warrior)
    @health = warrior.health

    if warrior.feel.wall?
      warrior.pivot!
    else
      if captives_rescued? == false
        if warrior.feel.captive?
          warrior.rescue!
          @captives_rescued += 1
        else
          forward(warrior)
        end
      else
        if warrior.feel.captive?
          warrior.rescue!
        else
          forward(warrior)
        end
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
    return true
  end


  def forward(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      if warrior.feel.empty?
        if @health < 20
          beingAttacked?(warrior)
        else
          warrior.walk!
        end
      else
        warrior.attack!
      end
    end
  end

  def assessAndGo(warrior)
    if warrior.health < 15
      if warrior.look.any?
        warrior.shoot!
      else
        if warrior.feel(:backward).wall?
          warrior.rest!
        else
          warrior.walk!(:backward)
        end
      end
    else
      if warrior.feel.empty?
        warrior.walk!
      else
        warrior.attack!
      end
    end
  end

  def beingAttacked?(warrior)
    if @health < @endhealth
      assessAndGo(warrior)
    else
      if warrior.look[2].enemy?
        if warrior.look(:backward)[2].enemy?
          warrior.shoot!(:backward)
        else
          warrior.shoot!
        end
      else
        warrior.rest!
      end
    end
  end

end
