require_relative 'hand'

class Player
  attr_reader :name, :points
  attr_accessor :cash

  SCORE_LIMIT = 21
  NAME_FORMAT = /^[a-z]{3,25}$/i

  def initialize(name)
    @hand = Hand.new
    @name = name.capitalize
    validate!
    @cash = 100
  end

  def score
    ace = 0
    points = 0

    @hand.cards.each do |card|
      ace += 1 if card.ace?
      points += card.value
    end

    ace >= 1 && points > SCORE_LIMIT ? points - 10 : points
  end

  def display_cards
    str = ''
    @hand.cards.each { |card| str += card.display }
    str
  end

  def take_card(deck)
    validate_cards_count!
    @hand.cards << deck.deal_card
  end

  def throw_cards
    @hand.cards = []
  end

  protected

  def validate!
    raise PlayerError, 'invalid name! enter 3 to 25 letters' if @name !~ NAME_FORMAT
  end

  def validate_cards_count!
    raise PlayerError, 'too many cards, you can take only three' unless check_limit
  end

  def validate_cashe!
    raise PlayerError, 'sorry, you have no money...' unless positive?
  end

  def check_limit
    @hand.cards.count < Hand::CARDS_LIMIT
  end

  def positive?
    @cash > 0
  end
end

class PlayerError < RuntimeError
end
