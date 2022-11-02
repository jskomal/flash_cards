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

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts '-------------------------------------------------'
    @deck.cards.count.times do
      play_turn
    end

    puts '****** Game over! ******'
    puts "You had #{@number_correct} correct guesses out of #{@turns.count} for a total score of #{percent_correct}%"
    puts "STEM - #{percent_correct_by_category(:STEM)}% Correct"
    puts "Turing Staff - #{percent_correct_by_category(:Turing_Staff)}% Correct"
    puts "Pop Culture - #{percent_correct_by_category(:Pop_Culture)}% Correct"
  end

  def play_turn
    puts "This is card number #{@turns.count + 1} out of #{@deck.cards.count}"
    puts "Question: #{current_card.question}"
    input = gets.chomp
    turn = take_turn(input)
    puts turn.feedback
    puts '-------------------------------------------------'
  end
end
