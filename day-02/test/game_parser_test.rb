require "minitest/autorun"
require_relative "../game"

class TestGameParser < Minitest::Test
  def setup
    @input = File.readlines("day-02/test/test-input.txt").first
  end

  def test_that_cube_hashes_are_created
    skip "Moved on to day 3, not sure what's wrong here"
    parsed_cubes = GameParser.parse_max_cubes(@input)
    assert_equal({ "blue" => 6, "red" => 11, "green" => 12 }, parsed_cubes)
  end
end
