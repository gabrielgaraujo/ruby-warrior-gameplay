class Player
  def play_turn(warrior)
    warrior = Warrior.new(warrior)
  end

  class Warrior
    def initialize(warrior)
      @warrior = warrior
    end

    def direction_of_stairs
      warrior.direction_of_stairs
    end

    def feel
      warrior.feel
    end

    def walk!
      warrior.walk!
    end

    private

    attr_reader :warrior
  end
end
