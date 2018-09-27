require_relative 'card'
require_relative 'inputs'
require_relative 'outputs'
require_relative 'player'

class Game
  def initialize
    @output = Ouputs.new
    @input = Inputs.new
  end

  def start
    # @output.welcome
    # @input.wait_to_enter ? 'enter' : exit
p    player = Player.new("Jezman")
p    dealer = Player.new('Dealer')
p    card = Card.new('K', "^")
  end
end
