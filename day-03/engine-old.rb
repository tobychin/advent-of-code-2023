class OldEngine
  def initialize(schematic)
    @schematic = schematic.split("\n")
  end

  def part_numbers
    part_numbers = []
    @schematic.each_with_index do |row, row_index|
      row.split("").each_with_index do |col, column_index|
        next if col.eql?(".")
        next if symbol?(col)

        if row_index.zero?
          if col.to_i.zero?
            if symbol?(@schematic[row_index.to_i + 1][col.to_i]) || symbol?(@schematic[row_index + 1][col.to_i + 1])
              get_number(row, column_index)
            end
          else
            if symbol?(@schematic[row_index.to_i + 1][col.to_i - 1]) || symbol?(@schematic[row_index.to_i + 1][col.to_i]) || symbol?(@schematic[row_index + 1][col.to_i + 1])
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
    input_array = str.split("")
    if start_at.zero?
      str_array = input_array.take_while do |char|
        char != "."
      end
    else
      str_array = []
      (-100..0).to_a.reverse.each do |i|
        index = start_at + i
        break if input_array[index].eql?(".")

        str_array.prepend(input_array[index])
      end
      (1..100).to_a.each do |i|
        index = start_at + i
        break if input_array[index].eql?(".")

        str_array.append(input_array[index])
      end
    end
    str_array.join("").to_i
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