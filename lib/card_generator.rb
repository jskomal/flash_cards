class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def create_cards
    lines = File.read(@filename).split("\n")
    lines.map do |line|
      question, answer, category = line.split(',')
      Card.new(question, answer, category.split(' ').join('_').to_sym)
    end
  end
end
