class Hand
  attr_accessor :cards

  CARDS_LIMIT = 3

  def initialize
    @cards = []
  end

  def calculate
    ace = 0
    points = 0

    @cards.each do |card|
      ace += 1 if card.ace?
      points += ace > 1 && card.ace? ? 1 : card.value
    end

    points
  end
end
