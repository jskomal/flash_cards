require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'contains the provided cards' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'keeps a count of the contained cards' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end

  it 'has a method to return an array of cards matching the input category' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq([card_two, card_three])
    expect(deck.cards_in_category(:Geography)).to eq([card_one])
    expect(deck.cards_in_category('Pop Culture')).to eq([])
  end
end
