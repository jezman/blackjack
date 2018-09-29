class Deck
  RANKS = Array(2..10) + %w[J Q K A].freeze
  SUITES = %w[♠ ♦ ♥ ♣].freeze

  def initialize
    @deck ||= create_deck
  end

  def deal_card
    create_deck if @deck.empty?
    @deck.shift
  end

  private

  def create_deck
    deck = []
    RANKS.each { |rank| SUITES.each { |suite| deck << Card.new(rank, suite) } }
    deck.shuffle!
  end
end
