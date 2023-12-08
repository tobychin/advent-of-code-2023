require "minitest/autorun"
require_relative "../my_code"

class TestGame < Minitest::Test
  def setup
    @inputs = ' 6 red, 4 blue, 2 green'
  end

  def test_that_the_collection_is_created
    assert_kind_of CubeCollection, CubeCollection.create_cubes(@inputs)
  end

  def test_that_cubes_are_created
    assert_kind_of Cube, CubeCollection.create_cubes(@inputs).first
  end
end
