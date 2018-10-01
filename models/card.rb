require_relative '../modules/card_template'
class Card
  include CardTemplate

  attr_reader :rank, :suite
  attr_accessor :value

  ACE_MIN_VALUE = 1
  ACE_MAX_VALUE = 11

  RANKS = Array(2..10) + %w[J Q K A].freeze
  SUITES = %w[♠ ♦ ♥ ♣].freeze

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    validate!
    @value = assign_value
  end

  def ace?
    @rank == 'A'
  end

  def face?
    %w[J Q K].include?(@rank)
  end

  def display
    face_card(@rank, @suite)
  end

  def display_hide
    hidden_card
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

  def validate!
    raise CardError, 'unknown rank' unless RANKS.include?(@rank)
    raise CardError, 'unknown suite' unless SUITES.include?(@suite)
  end
end

class CardError < RuntimeError
end
