require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'inputs'
require_relative 'outputs'
require_relative 'player'

class Game
  def initialize
    @show_splash = true
    @output = Outputs.new
    @input = Inputs.new
    splash_screen
  end

  def splash_screen
    @output.splash_screen if @show_splash
    @input.wait_to_enter ? preparing : exit
    @show_splash = false
  end

  def preparing
    # @player = Player.new(@input.username)
    @player = Player.new('jezman')
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = 0
  rescue HandError => e
    puts "error: #{e.message}. press any key to continue..."
    @input.wait_to_enter
    retry
  end

  def start
    deal_two_cards
    init_bet

    # raund
    @output.scores(@player, @dealer, @bank)
  end

  def raund
    @input.user_choice
  end

  def deal_two_cards
    2.times do
      @deck.deal_card(@player)
      @deck.deal_card(@dealer)
    end
  end

  def init_bet
    @bank += @player.init_bet + @dealer.init_bet
  end
end
