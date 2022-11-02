class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def create_cards
    lines = File.read(@filename).split('\n')
    lines.map do |line|
      entry = line.split(',')
      Card.new(entry[0], entry[1], entry[2].split(' ').join('_').to_sym)
    end
  end
end
