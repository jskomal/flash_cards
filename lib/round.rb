class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(response)
    current_turn = Turn.new(response, current_card)
    @turns << current_turn
    @number_correct += 1 if current_turn.correct?
    current_turn
  end

  def number_correct_by_category(category)
    result = 0
    @turns.each do |turn|
      result += 1 if turn.card.category == category && turn.correct?
    end
    result
  end

  def percent_correct
    return 0 if @turns.count.zero?

    @number_correct / @turns.count
  end

  def percent_correct_by_category(_category)
    return 0 if @turns.count.zero?
  end
end
