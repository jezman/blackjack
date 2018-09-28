class Hand
  attr_reader :name, :cash
  attr_accessor :cards

  INIT_BET = 10
  LIMIT_SCORE = 21
  NAME_FORMAT = /^[a-z]{3,25}$/i

  def initialize(name)
    @name = name.capitalize
    validate!
    @cash = 100
    @cards = []
    @points = 0
  end

  def score
    points = 0
    cards.each { |card| points += card.value }
    @points = points
  end

  def init_bet
    @cash -= INIT_BET
    INIT_BET
  end

  def display_cards
    str = ''
    cards.each { |card| str += card.display }
    str
  end

  protected

  def validate!
    raise HandError, 'invalid name! enter 3 to 25 letters' if @name !~ NAME_FORMAT
  end
end

class HandError < RuntimeError
end
