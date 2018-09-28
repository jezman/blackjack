class Card
  attr_reader :rank, :suite
  attr_accessor :value

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    @value = assign_value
  end

  def switch_ace_value
    @value = 11 if @value == 1
  end

  def ace?
    @rank == 'A'
  end

  def display
    "#{@rank}#{@suite} "
  end

  def face?
    %w[J Q K].include?(@rank)
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
end
