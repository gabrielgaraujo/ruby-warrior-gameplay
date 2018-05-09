class Player
  def play_turn(warrior)
    warrior = Warrior.new(warrior)
    warrior.walk_to_stairs!
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

    def walk!(direction: :forward)
      warrior.walk!(direction)
    end

    def walk_to_stairs!
      walk!(direction: direction_of_stairs)
    end

    private

    attr_reader :warrior
  end
end
