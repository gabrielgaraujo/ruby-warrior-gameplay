class Player
  def play_turn(warrior)
    warrior = Warrior.new(warrior)
    warrior.walk_to_stairs!
  end

  class Warrior
    def initialize(warrior)
      @warrior = warrior
    end

    # Walk towards the stairs.
    def walk_to_stairs!
      walk!(direction_of_stairs)
    end

    private

    attr_reader :warrior

    # Attacks a unit in given direction (:forward by default).
    def attack!(direction = :forward)
      warrior.attack!(direction)
    end

    def attack_or_walk!(direction = :forward)
      feel(direction).enemy? ? attack!(direction) : warrior.walk!(direction)
    end

    # Binds a unit in given direction to keep him from moving (forward by default).
    def bind!(direction = :forward)
      warrior.bind!(direction)
    end

    # Returns the direction (:left, :right, :forward, :backward) the stairs are from your location.
    def direction_of_stairs
      warrior.direction_of_stairs
    end

    # Returns a Space for the given direction (:forward by default).
    def feel(direction = :forward)
      warrior.feel(direction)
    end

    # Returns an integer representing your health.
    def health
      warrior.health
    end

    # Rescue a captive from his chains (earning 20 points) in given direction (forward by default).
    def rescue!(direction = :forward)
      warrior.rescue!(direction)
    end

    # Gain 10% of max health back, but do nothing more.
    def rest!
      warrior.rest!
    end

    # Move in the given direction, but attack if run into enemy (:forward by default).
    def walk!(direction = :forward)
      attack_or_walk!(direction)
    end
  end
end
