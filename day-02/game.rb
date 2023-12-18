class Game
  attr_reader :id, :sets

  def initialize(id, cube_sets)
    @id = id
    @sets = cube_sets
  end

  def possible?(cube_combination)
    cube_combination.all? do |color, quantity|
      @sets[color].max <= quantity
    end
  end

  def to_s
    "Game ID: #{id}; Cubes: #{@sets}"
  end
end

class GameParser
  class << self
    def parse_max_cubes(str)
      cube_sets = str.scan(/(\d+)\s(green|blue|red)/)
      cubes = {
        "green" => [],
        "blue" => [],
        "red" => []
      }
      cube_sets.each do |q, c|
          cubes[c].push(q.to_i)
      end
      cubes
    end
  end
end

class GameCreator
  attr_reader :game

  def initialize(str)
    @parts = str.split(':')
    cubes = GameParser.parse_max_cubes(@parts.last)
    @game = Game.new(game_id, cubes)
  end

  private
  def game_id
    @game_id ||= @parts.first.delete('A-z').strip.to_i
  end
end
