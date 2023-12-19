class Card
  attr_reader :id, :card_numbers, :winning_numbers

  def initialize(card_data)
    data_array = card_data.scan(/Card\s+(\d+):([\s+\d+]*)\s+\|\s+([\s+\d+]*)/).flatten
    @id = data_array.first.to_i
    @card_numbers = data_array[1].strip.split(/\s+/).map(&:to_i)
    @winning_numbers = data_array[2].strip.split(/\s+/).map(&:to_i)
  end

  def points
    return 0 if winners.empty?
    return 1 if winners.size.eql?(1)

    2 ** (winners.size - 1)
  end
  
  def winners
    @winners ||= (card_numbers & winning_numbers)
  end
end