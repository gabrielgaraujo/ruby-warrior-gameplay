class Warrior
  attr_accessor :soul

  def attack!(direction = :forward)
    soul.attack!(direction)
  end

  def attack_or_walk!(direction = :forward)
    feel(direction).enemy? ? attack!(direction) : soul.walk!(direction)
  end

  def bind!(direction = :forward)
    soul.bind!(direction)
  end

  def direction_of_stairs
    soul.direction_of_stairs
  end

  def feel(direction = :forward)
    soul.feel(direction)
  end

  def health
    soul.health
  end

  def help!(direction = :forward)
    soul.rescue!(direction)
  end

  def look_around
    Player::SPACE_TYPES.map do |space_type|
      { space_type => look_around_for(space_type) }
    end.reduce(:merge)
  end

  def look_around_for(space_type)
    Player::DIRECTIONS_CLOCKWISE.select do |direction|
      feel(direction).send("#{space_type}?")
    end
  end

  def rest!
    soul.rest!
  end

  def rescue_near_captive!
    Player::DIRECTIONS_CLOCKWISE.each do |direction|
      return help!(direction) if feel(direction).captive?
    end

    false
  end

  def rescue_prisoner!(direction = :forward)
    soul.rescue!(direction)
  end

  def walk!(direction = :forward)
    attack_or_walk!(direction)
  end

  def walk_to_stairs!
    walk!(direction_of_stairs)
  end
end
