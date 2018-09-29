class Card
  attr_reader :rank, :suite
  attr_accessor :value

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    @value = assign_value
  end

  def ace?
    @rank == 'A'
  end

  def display
    "#{@rank}#{@suite} "
  end

  private

  def assign_value
    @value = if face?
               10
             elsif ace?
               11
             else
               @rank
             end
  end

  def face?
    %w[J Q K].include?(@rank)
  end
end
