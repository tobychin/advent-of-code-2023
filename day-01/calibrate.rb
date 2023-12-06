class Calibrate
  def initialize(params)
    @codes = params
  end

  def values
    @values ||= codes.map do |c|
      "#{first_digit(c)}#{last_digit(c)}".to_i
    end
  end

  def sum
    @sum ||= values.sum
  end

  private
  attr_reader :codes

  NUMBERS = {
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
  }.freeze
  private_constant :NUMBERS

  def first_digit(str)
    digit = str.scan(/one|two|three|four|five|six|seven|eight|nine|\d/).flatten.first
    NUMBERS[digit] || digit
  end

  def last_digit(str)
    digit = str.reverse.scan(/enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|\d/).flatten.first
    NUMBERS[digit.reverse] || digit
  end
end
