class Player
  def initialize()
    @health = 20
  end
  def play_turn(warrior)
    # add your code here
    if warrior.feel.empty? then
        if warrior.health < @health
            warrior.walk!
        elsif warrior.health < 20 then
            warrior.rest!
        else
            warrior.walk!
        end
    else 
        warrior.attack!
    end
    @health = warrior.health
  end
end
