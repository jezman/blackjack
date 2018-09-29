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
    @input.wait_to_enter ? preparing : exit
  end

  def start
    loop do
      init_deal
      init_bet

      turn
    end
  end

  private

  def splash_screen
    return unless @show_splash
    @output.splash_screen
    @show_splash = false
  end

  def preparing
    @player = Player.new(@input.username)
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = 0
  rescue HandError => e
    @output.error(e)
    retry
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
    when 'a', 'add' then player_turn
    when 'o', 'open' then define_winner
    when 'p', 'pass' then dealer_turn
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

  def dealer_turn
    @dealer.take_card(@deck) if @dealer.turn?
    define_winner
  end

  def player_turn
    @player.take_card(@deck)
    stats
    dealer_turn
  end

  def reset
    @bank = 0
    [@player, @dealer].map(&:throw_cards)
  end

  def display_cards
    stats(false)
  end

  def init_bet
    @bank += @player.bet + @dealer.bet
  end

  def define_winner
    win = if @player.score > Hand::LIMIT_SCORE
            @dealer
          elsif @dealer.score > Hand::LIMIT_SCORE
            @player
          elsif !draw?
            [@player, @dealer].max_by(&:score)
          end
    winner(win)
    @input.continue? ? reset : exit
  end

  def winner(player = nil)
    player.take_bet(@bank) if player
    display_cards
    @output.winner(player)
  end

  def money_back
    cash = @bank / 2
    @player.take_bet(cash)
    @dealer.take_bet(cash)
  end

  def draw?
    @dealer.score == @player.score
  end
end
