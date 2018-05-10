class Warrior
  attr_writer :soul

  def rescue_near_captive!
    Player::DIRECTIONS_CLOCKWISE.each do |direction|
      return help!(direction) if feel(direction).captive?
    end

    false
  end

  # Walk towards the stairs
  def walk_to_stairs!
    walk!(direction_of_stairs)
  end

  private

  attr_reader :soul

  # Attacks a unit in given direction
  def attack!(direction = :forward)
    soul.attack!(direction)
  end

  def attack_or_walk!(direction = :forward)
    feel(direction).enemy? ? attack!(direction) : soul.walk!(direction)
  end

  # Binds a unit in given direction to keep him from moving
  def bind!(direction = :forward)
    soul.bind!(direction)
  end

  # Returns the direction to the stairs from your location
  def direction_of_stairs
    soul.direction_of_stairs
  end

  # Returns a Space for the given direction
  def feel(direction = :forward)
    soul.feel(direction)
  end

  # Returns an integer representing your health
  def health
    soul.health
  end

  # Rescue a captive from his chains
  def help!(direction = :forward)
    soul.rescue!(direction)
  end

  # Gain 10% of max health back
  def rest!
    soul.rest!
  end

  # Move in the given direction, but attack if run into an enemy
  def walk!(direction = :forward)
    attack_or_walk!(direction)
  end
end
