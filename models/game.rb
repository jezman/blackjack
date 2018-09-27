require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'inputs'
require_relative 'outputs'
require_relative 'player'

class Game
  attr_reader :player, :dealer, :deal
  attr_accessor :bank

  def initialize
    @output = Ouputs.new
    @input = Inputs.new
    @output.splash_screen
    @input.wait_to_enter
    @player = Player.new(@input.username)
    @deck = Deck.new
    @dealer = Dealer.new
    deal_two_cards
    init_bet

    @output.main_interface(@player, @dealer)
  end

  def deal_two_cards
    2.times do
      @player.cards << @deck.deal_card
      @dealer.cards << @deck.deal_card
    end
  end

  def init_bet
    @player.init_bet
    @dealer.init_bet
  end
end
