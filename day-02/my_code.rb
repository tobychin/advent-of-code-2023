class CubeCollection
  include Enumerable

  class << self
    def create_cubes(str)
      puts str
      cubes = str.split(',').map do |row|
        q, c = row.strip.split(' ')
        Cube.new(q, c)
      end
      new(cubes)
    end
  end
  
  def initialize(cubes)
    @cubes = cubes
  end

  def each(&block)
    @cubes.map(&block)
  end
end

class Cube
  attr_reader :color, :quantity
  
  def initialize(quantity, color)
    @color = color
    @quantity = quantity
  end

  def to_s
    "Cube - color: #{color}, quantity: #{quantity}"
  end
end

class Game
  attr_reader :id, :sets

  def initialize(id, cube_sets)
    @id = id
    @sets = cube_sets
  end
  
  def possible?(cube_combination)

  end
end

class GameCreator
  attr_reader :game

  def initialize(str)
    @parts = str.split(':')
    cube_collections = @parts.last.split(';').map do |cube_set_row|
      CubeCollection.create_cubes(cube_set_row)
    end

    @game = Game.new(game_id, cube_collections)
  end

  private
  def game_id
    @game_id ||= @parts.first.delete('A-z').strip.to_i
  end
end
