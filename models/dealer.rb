require_relative 'hand'

class Dealer < Hand
  NAME = 'Dealer'.freeze

  def initialize
    super(NAME)
  end

  def display_cards
    str = ''
    cards.size.times { str += '🂠  ' }
    str
  end
end
