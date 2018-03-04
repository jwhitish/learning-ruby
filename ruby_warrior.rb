#my commands for the bloc.io ruby warrior game
#completed through level 5, currently on 6
class Player
  def play_turn(warrior)
    @health = warrior.health

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

    @endhealth = warrior.health

  end
end
