require "minitest/autorun"
require_relative "../game"

class TestGame < Minitest::Test
  def setup
    inputs = File.read("day-02/test/test-input.txt").split('\n')
    game_creators = inputs.map { |i| GameCreator.new(i) }
    @game = game_creators.first.game
  end

  def test_that_games_are_created
    assert_equal @game.id, 1
  end

  def test_that_a_game_is_possible
    assert @game.possible?({"blue" => 0, "red" => 0, "green" => 0})
  end

  def test_that_a_game_is_not_possible_with_too_much_blue
    outcome = @game.possible?({"blue" => 17, "red" => 0, "green" => 0})
    refute_nil outcome
    refute outcome
  end

  def test_that_a_game_is_not_possible_with_too_much_red
    outcome = @game.possible?({"blue" => 0, "red" => 99, "green" => 0})
    refute_nil outcome
    refute outcome
  end

  def test_that_a_game_is_not_possible_with_too_much_green
    outcome = @game.possible?({"blue" => 0, "red" => 0, "green" => 99})
    refute_nil outcome
    refute outcome
  end
end
