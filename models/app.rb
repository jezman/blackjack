require_relative 'player'
require_relative 'outputs'
require_relative 'inputs'

class App
  def initialize
    @output = Ouputs.new
    @input = Inputs.new
  end

  def start
    @output.welcome
    @input.wait_to_enter ? 'enter' : exit
p    player = Player.new(@input.username)
p    dealer = Player.new('Dealer')
  end
end
