require "minitest/autorun"
require_relative "../my_code"

class TestGame < Minitest::Test
  def setup
    @inputs = File.read("test-input.txt").split('\n')
  end

  def test_that_games_are_created
    game_creators = @inputs.map { |i| GameCreator.new(i) }
    assert_equal game_creators.first.game.id, 1
  end

  def test_that_cube_sets_are_created
    game_creators = @inputs.map { |i| GameCreator.new(i) }
    assert_kind_of CubeCollection, game_creators.first.game.sets.first
  end
end
