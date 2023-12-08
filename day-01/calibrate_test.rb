require "minitest/autorun"
require_relative "calibrate"

class TestCalibrate < Minitest::Test
  def setup
    @inputs = [
      "a20000threeb",
      "4faksDsixksdgf1",
      "oneight",
      "two1234",
      "oneight1234five",
      "two1nine",
      "4two1nine4",
      "asdf3lkjh",
      "asdfsevenlkjh",
      "1qxfvkbmtqvrnztnrztplqldhrmdpgtvcggsixflknn"
    ]
  end

  def test_that_the_values_are_numeric
    assert_equal [23, 41, 18, 24, 15, 29, 44, 33, 77, 16], Calibrate.new(@inputs).values
  end

  def test_that_the_sum_is_correct
    assert_equal 320, Calibrate.new(@inputs).sum
  end
end