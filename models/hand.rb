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
    ace = 0
    points = 0
    cards.each do |card|
      ace += 1 if card.ace?
      points += card.value
    end
    ace >= 1 && points > LIMIT_SCORE ? points - 10 : points
  end

  def bet
    validate_cashe!
    @cash -= BET_SIZE
    BET_SIZE
  end

  def take_bet(value)
    @cash += value
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

  def throw_cards
    @cards = []
  end

  protected

  def validate!
    raise HandError, 'invalid name! enter 3 to 25 letters' if @name !~ NAME_FORMAT
  end

  def validate_cards_count!
    raise HandError, 'too many cards, you can take only three' unless check_limit
  end

  def validate_cashe!
    raise HandError, 'sorry, you have no money...' unless positive?
  end

  def check_limit
    @cards.count < CARDS_LIMIT
  end

  def positive?
    @cash > 0
  end
end

class HandError < RuntimeError
end
