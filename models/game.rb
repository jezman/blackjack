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
    @deck = Deck.new
    @player = Player.new('Jezman')
    @dealer = Dealer.new
    deal_two_cards

    p @player.cards
    p @dealer.cards
  end

  def deal_two_cards
    2.times do
      @player.cards << @deck.deal_card
      @dealer.cards << @deck.deal_card
    end
  end
end
