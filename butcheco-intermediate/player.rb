class Player
  def play_turn(warrior)
    warrior = Warrior.new(warrior)
    warrior.walk_to_stairs!
  end

  class Warrior
    def initialize(warrior)
      @warrior = warrior
    end

    # Attacks a unit in given direction (:forward by default).
    def attack!(direction: :forward)
      warrior.attack!
    end

    # Returns the direction (:left, :right, :forward, :backward) the stairs are from your location.
    def direction_of_stairs
      warrior.direction_of_stairs
    end

    # Returns a Space for the given direction (:forward by default).
    def feel(direction: :forward)
      warrior.feel
    end

    # Returns an integer representing your health.
    def health
      warrior.health
    end

    # Gain 10% of max health back, but do nothing more.
    def rest!
      warrior.rest!
    end

    # Move in the given direction (:forward by default).
    def walk!(direction: :forward)
      warrior.walk!(direction)
    end

    # Walk towards the stairs.
    def walk_to_stairs!
      walk!(direction: direction_of_stairs)
    end

    private

    attr_reader :warrior
  end
end
