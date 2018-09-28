class Hand
  attr_reader :name, :cash
  attr_accessor :cards

  CARDS_LIMIT = 3
  BET_SIZE = 10
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

  def bet
    @cash -= BET_SIZE
    BET_SIZE
  end

  def take_bet(value)
    @cards += value
  end

  def display_cards
    str = ''
    cards.each { |card| str += card.display }
    str
  end

  def take_card(deck)
    validate_cards_count!
    @cards << deck.deal_card
  end

  protected

  def validate!
    raise HandError, 'invalid name! enter 3 to 25 letters' if @name !~ NAME_FORMAT
  end

  def validate_cards_count!
    raise HandError, 'too many cards, you can take only three' unless check_cards_count
  end

  def check_cards_count
    @cards.count < CARDS_LIMIT
  end
end

class HandError < RuntimeError
end
