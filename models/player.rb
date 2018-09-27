class Player
  attr_reader :name, :cash
  attr_accessor :cards

  NAME_FORMAT = /^[a-z]{3,25}$/i
  INIT_BET = 10

  def initialize(name)
    @name = name.capitalize
    validate!
    @cash = 100
    @cards = []
    @points = 0
  end

  def points
    points = 0
    @cards.each { |card| points += card.value }
    @points = points
  end

  def init_bet
    @cash -= INIT_BET
    INIT_BET
  end

  def cards_to_s
    cards = []
    @cards.each { |card| cards << "#{card.rank}#{card.suite}" }
    cards.join(' ')
  end

  def cash_to_s
    "#{@cash}$"
  end

  protected

  def validate!
    raise 'invalid name' if @name !~ NAME_FORMAT
  end
end
