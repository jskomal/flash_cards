require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_one = Card.new('What is 5 + 5?', '10', :STEM)
card_two = Card.new("What is Rachel's favorite animal?", 'red panda', :Turing_Staff)
card_three = Card.new("What is Mike's middle name", 'nobody knows', :Turing_Staff)
card_four = Card.new('What cardboard cutout lives at Turing?', 'Justin Bieber', :Pop_Culture)
cards = [card_one, card_two, card_three, card_four]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
