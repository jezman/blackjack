class Card
  attr_reader :rank, :suite
  attr_accessor :value

  ACE_MIN_VALUE = 1
  ACE_MAX_VALUE = 11

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    @value = assign_value
  end

  def ace?
    @rank == 'A'
  end

  def face?
    %w[J Q K].include?(@rank)
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
end
