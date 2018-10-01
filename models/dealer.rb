require_relative 'player'
require_relative '../modules/card_template'

class Dealer < Player
  include CardTemplate

  NAME = 'Dealer'.freeze

  def initialize
    super(NAME)
  end

  def hide_cards
    tmp = []
    @hand.cards.each { |card| tmp << card.display_hide }
    cards_string(tmp)
  end

  def turn?
    score < 17
  end
end
