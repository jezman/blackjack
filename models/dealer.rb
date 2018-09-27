require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
  end

  def hide_cards_to_s
    cards_to_s.split(' ').map { |c| c.replace('**') }.join(' ')
  end
end
