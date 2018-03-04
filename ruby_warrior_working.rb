class Player
  def play_turn(warrior)
    @health = warrior.health

    if warrior.feel.captive?
      warrior.rescue!
    else
      if warrior.feel.empty?
        if @health < 20
          if @health < @endhealth
            if warrior.feel.empty?
              warrior.walk!
            else
              warrior.attack!
            end
          else
            warrior.rest!
          end
        else
          warrior.walk!
        end

      else
        warrior.attack!
      end
    end
    @endhealth = warrior.health
  end
end
