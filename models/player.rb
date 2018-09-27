class Player
  attr_reader :name, :cash
  attr_accessor :cards

  def initialize(name)
    @name = name.capitalize
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
    @cash -= 10
  end

  def cards_to_s
    cards = []
    @cards.each { |card| cards << "#{card.rank}#{card.suite}" }
    cards.join(' ')
  end

  def cash_to_s
    "#{@cash}$"
  end
end
