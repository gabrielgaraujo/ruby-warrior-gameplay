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
    return if warrior.rescue_near_captive!
    warrior.walk_to_stairs!
  end
end
