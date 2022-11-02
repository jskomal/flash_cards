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
    return 0.0 if @turns.count.zero?

    (@number_correct.to_f / @turns.count * 100).round(1)
  end

  def percent_correct_by_category(category)
    return 0.0 if @turns.count.zero? || number_correct_by_category(category).zero?

    category_count = 0
    @turns.each do |turn|
      category_count += 1 if turn.card.category == category
    end
    (number_correct_by_category(category).to_f / category_count * 100).round(1)
  end
end
