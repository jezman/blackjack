require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
  end

  def cards_to_s
    super.split(' ').map { |c| c.replace('**') }.join(' ')
  end
end
