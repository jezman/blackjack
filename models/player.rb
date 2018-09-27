class Player
  attr_reader :name, :cash

  def initialize(name)
    @name = name.capitalize
    @cash = 100
  end
end
