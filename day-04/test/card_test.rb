require "minitest/autorun"
require_relative "../card"

class TestCard < Minitest::Test
  def setup
    @input = File.read("day-04/test/test-input.txt").split("\n")
    @card = Card.new(@input.first)
  end
  
  def test_parses_id_correctly
    assert_equal 1, @card.id
  end

  def test_parses_card_numbers_correctly
    assert_equal [41, 48, 83, 86, 17], @card.card_numbers
  end

  def test_parses_winning_numbers_correctly
    assert_equal [83, 86, 6, 31, 17, 9, 48, 53], @card.winning_numbers
  end

  def test_winners_finds_correct_numbers
    assert_equal [48, 83, 86, 17], @card.winners
  end

  def test_that_points_calculate_correctly
    assert_equal 8, @card.points
  end
end