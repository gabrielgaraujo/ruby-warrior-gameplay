class Warrior
  attr_accessor :soul, :memorized_captives

  def initialize
    @memorized_captives = []
  end

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
    soul.listen
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

  def memorize_captive(captive_direction)
    return if !memorized_captives.empty? &&
              memorized_captives.map { |memorized| memorized.size == 1 }.any?

    memorized_captives << [captive_direction]
  end

  def memorize_captives(captives_directions)
    captives_directions.each { |direction| memorize_captive(direction) }
  end

  def rescue_near_captive!
    Player::DIRECTIONS_CLOCKWISE.each do |direction|
      return help!(direction) if feel(direction).captive?
    end

    false
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
