require "minitest/autorun"
require_relative "../engine"

class TestEngine < Minitest::Test
  def setup
    @schematic = File.read("day-03/test/sample-schematic.txt")
  end

  def test_part_numbers_are_found
    engine = Engine.new(@schematic)
    assert_equal [467, 35, 633, 617, 592, 755, 664, 598], engine.part_numbers
  end

  def test_part_number_sum
    engine = Engine.new(@schematic)
    assert_equal 4631, engine.part_number_sum
  end

  def test_get_number_finds_a_full_number
    str = "419..467.."
    engine = Engine.new(@schematic)
    assert_equal 419, engine.get_number(str, 0)
  end

  def test_get_number_finds_a_full_number_in_the_middle_of_a_string
    str = "419..467.."
    engine = Engine.new(@schematic)
    assert_equal 467, engine.get_number(str, 6)
  end
end