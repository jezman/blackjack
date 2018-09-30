require_relative 'card'

class Deck
  def initialize
    @deck ||= create_deck
  end

  def deal_card
    @deck = create_deck if @deck.empty?
    @deck.shift
  end

  private

  def create_deck
    deck = []
    ranks = Card::RANKS
    suites = Card::SUITES

    ranks.each { |rank| suites.each { |suite| deck << Card.new(rank, suite) } }

    deck.shuffle!
  end
end
