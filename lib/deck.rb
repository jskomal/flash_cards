class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(input_category)
    result = []
    @cards.each do |card|
      result << card if card.category == input_category
    end
    result
  end
end
