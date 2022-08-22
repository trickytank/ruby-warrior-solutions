class Player
  def initialize()
    @health = 20
    @direction = 'forward'
  end
  def play_turn(warrior)
    # add your code here
    if warrior.feel.wall? then
        warrior.pivot!
    else
        if @direction == 'forward' then
            if warrior.feel.empty? then
                ahead = warrior.look
                if warrior.look[1].enemy? || warrior.look[2].enemy? then
                    warrior.shoot!
                else
                    if warrior.health < @health
                        if warrior.health < 7 then
                            warrior.walk!:backward
                            @direction = 'backward'
                        else
                            warrior.walk!
                        end
                    elsif warrior.health < 20 then
                        warrior.rest!
                    else
                        warrior.walk!
                    end
                end
            else 
                if warrior.feel.captive?
                    warrior.rescue!
                else
                    warrior.attack!
                end
            end
        else
            if warrior.feel(:backward).captive? then
                warrior.rescue!:backward
            elsif warrior.feel(:backward).wall? then
                @direction = 'forward'
                warrior.rest!
            else
                warrior.walk!:backward
            end
        end
    end
    @health = warrior.health
  end
end
