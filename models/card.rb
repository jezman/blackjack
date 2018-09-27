class Card
  attr_reader :rank, :site
  attr_accessor :value

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    @value = assign_value(rank)
  end

  private

  def assign_value(rank)
    @value = if %w[J Q K].include?(rank)
               10
             elsif rank == 'A'
               1
             else
               rank
             end
  end
end
