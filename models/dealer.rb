require_relative 'player'

class Dealer < Player
  NAME = 'Dealer'.freeze

  def initialize
    super(NAME)
  end

  def hide_cards
    str = ''
    @hand.cards.size.times { str += '🂠  ' }
    str
  end

  def turn?
    score < 17
  end
end
