require './lib/card'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before do
    @card_generator = CardGenerator.new('cards.txt')
  end

  it 'should initialize an instance of CardGenerator' do
    expect(@card_generator).to be_instance_of(CardGenerator)
  end

  it 'should create an array of cards' do
    expect(@card_generator.create_cards).to be_an Array
  end
end
