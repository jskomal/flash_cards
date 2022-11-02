require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'contains a deck' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to be_instance_of(Deck)
    expect(round.deck).to eq(deck)
  end

  it 'starts with an empty array of turns' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'has a method to display the current card' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card_one)
  end

  it 'has a method to take a turn' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)
    first_turn = round.take_turn('Juneau')

    expect(first_turn.card.question).to eq('What is the capital of Alaska?')
    expect(first_turn.card.answer).to eq('Juneau')
    expect(first_turn.card.category).to eq(:Geography)
    expect(first_turn.guess).to eq('Juneau')
  end

  it 'has a counter for the number of correct answers' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.number_correct).to eq(0)
    # correct input
    round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)
    # incorrect input
    round.take_turn('Feel Good Inc.')

    expect(round.number_correct).to eq(1)
  end

  it 'should increment the current card on turn' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card_one)

    round.take_turn('Juneau')

    expect(round.current_card).to eq(card_two)
  end

  it 'should increment the count of turns correctly' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns.count).to eq(0)

    round.take_turn('Juneau')

    expect(round.turns.count).to eq(1)

    round.take_turn('Feel Good Inc')

    expect(round.turns.count).to eq(2)
  end

  it 'should be able to return previous feedback' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    # expect(round.turns.last.feedback).to eq('No turns have been taken')

    round.take_turn('Juneau')

    expect(round.turns.last.feedback).to eq('Correct!')

    round.take_turn('Feel Good Inc.')

    expect(round.turns.last.feedback).to eq('Incorrect.')
  end

  it 'should count the number of correct answers in total, by category, by percent, and by percent in a category' do
    card_one = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_two = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    card_three = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                          'North north west', :STEM)
    cards = [card_one, card_two, card_three]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.number_correct).to eq(0)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct).to eq(0.0)
    expect(round.percent_correct_by_category(:STEM)).to eq(0.0)

    round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.percent_correct).to eq(100.0)
    expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)

    round.take_turn('Feel Good Inc.')

    expect(round.number_correct).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)

    round.take_turn('North north west')

    expect(round.number_correct).to eq(2)
    expect(round.number_correct_by_category(:STEM)).to eq(1)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.percent_correct).to eq(66.7)
    expect(round.percent_correct_by_category(:STEM)).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
end
