class Engine
  def initialize(schematic)
    @schematic = schematic.split("\n")
  end

  def part_numbers
    part_numbers = []
    @schematic.each_with_index do |row_index, row|
      row.split("").each_with_index do |column_index, col|
        next if col.eql?(".")
        next if symbol?(col)

        if row_index.zero?
          if col.zero?
            if symbol?(@schematic[row_index + 1][col]) || symbol?(@schematic[row_index + 1][col + 1])
              get_number(row, column_index)
            end

          end
        elsif row_index.eql?(@schematic.length - 1)
        else
        end
      end
    end
    part_numbers
  end

  def part_number_sum
    0
  end

  def get_number(str, start_at)
    str_array = if start_at.zero?
      str.split("").take_while do |char|
        char != "."
      end
    else
      str
    end
    str_array.join("").to_i
  end
  
  private  
  
  def symbol?(str)
    str.match?(/[^a-zA-Z0-9.]/)
  end
end