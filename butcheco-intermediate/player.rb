require 'warrior'

class Player
  attr_reader :warrior

  DIRECTIONS_CLOCKWISE = %i[left forward right backward].freeze
  SPACE_TYPES = %i[captive empty enemy].freeze

  def initialize
    @warrior = Warrior.new
  end

  def play_turn(soul)
    warrior.soul = soul
    warrior.listen
    if warrior.look_around[:enemy].size > 1
      direction_to_bind = warrior.look_around[:enemy].reject do |direction|
        direction == warrior.direction_of_stairs
      end

      return if !direction_to_bind.nil? && warrior.bind!(direction_to_bind.pop)
    elsif warrior.look_around[:enemy].size == 1
      return if warrior.attack!(warrior.look_around[:enemy].pop)
    elsif warrior.rescue_captives!
    else
      warrior.walk_to_stairs!
    end
  end
end
