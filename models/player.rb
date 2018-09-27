class Player
  attr_reader :name, :cash
  attr_accessor :cards

  def initialize(name)
    @name = name.capitalize
    @cash = 100
    @cards = []
  end
end
