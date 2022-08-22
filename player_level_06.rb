class Player
  def initialize()
    @health = 20
    @direction = 'forward'
  end
  def play_turn(warrior)
    # add your code here
    if @direction == 'forward' then
        if warrior.feel.empty? then
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
    @health = warrior.health
  end
end
