require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'inputs'
require_relative 'outputs'
require_relative 'player'

class Game
  def initialize
    @show_splash = false
    # @show_splash = true
    @output = Outputs.new
    @input = Inputs.new
    splash_screen
    preparing
    # @input.wait_to_enter ? preparing : exit
  end

  def start
    init_deal
    init_bet

    turn
  end

  private

  def splash_screen
    return unless @show_splash
    @output.splash_screen
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

  def dealer_turn
    puts 'dealer turned'
  end

  def init_deal
    2.times do
      @player.take_card(@deck)
      @dealer.take_card(@deck)
    end
  end

  def turn
    stats
    choice
  rescue ChoiceError => e
    @output.error(e)
    retry
  rescue HandError => e
    @output.error(e)
    retry
  end

  def choice
    case @input.player_turn
    when 'a', 'add'
      @player.take_card(@deck)
      stats
      dealer_turn
    when 'o', 'open'
      display_cards
    end
  end

  def stats(hide = true)
    options = {
      player: @player,
      dealer: @dealer,
      bank: @bank
    }

    @output.scores(options, hide)
  end

  def display_cards
    stats(false)
  end

  def init_bet
    @bank += @player.init_bet + @dealer.init_bet
  end
end
