#my commands for the bloc.io ruby warrior game
#completed through level 6, currently on 7
class Player

  def play_turn(warrior)
    @health = warrior.health

    if warrior.feel.wall?
      warrior.pivot!
    else
      # if captives_rescued? == false
      #   if warrior.feel(:backward).captive?
      #     warrior.rescue!(:backward)
      #     @captives_rescued += 1
      #   else
      #     warrior.walk!(:backward)
      #   end
      # else
      #   if warrior.feel.captive?
      #     warrior.rescue!
      #   else
          forward(warrior)
        #end
        @endhealth = warrior.health
      #end
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
          beingAttacked(warrior)
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
      if warrior.feel(:backward).wall?
        warrior.rest!
      else
        warrior.walk!(:backward)
      end
    else
      if warrior.feel.empty?
        warrior.walk!
      else
        warrior.attack!
      end
    end
  end

  def beingAttacked(warrior)
    if @health < @endhealth
      assessAndGo(warrior)
    else
      warrior.rest!
    end
  end

end
