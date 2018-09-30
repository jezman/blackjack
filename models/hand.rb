require_relative 'player'
require_relative 'card'

class Hand
  attr_accessor :cards

  CARDS_LIMIT = 3

  def initialize
    @cards = []
  end

  def calculate
    aces = []
    points = 0
    @cards.each { |card| card.ace? ? aces << card : points += card.value }

    aces.empty? ? points : points += aces_count(points, aces)
  end

  private

  def aces_count(points, aces)
    score_limit = Player::SCORE_LIMIT
    min = Card::ACE_MIN_VALUE
    max = Card::ACE_MAX_VALUE

    case aces.size
    when 1 then points + max <= score_limit ? max : min
    when 2 then points + max + min <= score_limit ? max + min : min + min
    when 3 then max + min + min
    end
  end
end
