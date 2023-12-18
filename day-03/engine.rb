class Engine
  def initialize(schematic)
    @schematic = schematic.split("\n")
  end

  def part_numbers
    part_numbers = []
    
  end

  def part_number_sum
    0
  end

  def get_number(str, start_at)
    
  end
  
  private

  def last_column
    @last_column ||= @schematic.first.size - 1
  end
  
  def last_row
    @last_row ||= @schematic.size - 1
  end
  
  def symbol?(str)
    str.match?(/[^a-zA-Z0-9.]/)
  end
end