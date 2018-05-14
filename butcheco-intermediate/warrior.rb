class Warrior
  attr_accessor :soul, :safe_captives

  def attack!(direction = :forward)
    soul.attack!(direction)
  end

  def attack_or_walk!(direction = :forward)
    feel(direction).enemy? ? attack!(direction) : soul.walk!(direction)
  end

  def bind!(direction = :forward)
    soul.bind!(direction)
  end

  def direction_of(space)
    soul.direction_of(space)
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

  def listen
    spaces = soul.listen
    @safe_captives ||= spaces.select(&:captive?)
    spaces
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

  def rescue_captives!
    return if safe_captives.empty?
    captive = safe_captives.first
    if feel(direction_of(captive)).location == captive.location
      safe_captives.shift
      return help!(direction_of(captive))
    end

    walk!(direction_of(captive))
  end

  def rescue_prisoner!(direction = :forward)
    memorized_captives.delete([direction])
    return if direction.nil?
    soul.rescue!(direction)
  end

  def rest!
    soul.rest!
  end

  def walk!(direction = :forward)
    attack_or_walk!(direction)
  end

  def walk_to_stairs!
    walk!(direction_of_stairs)
  end
end
