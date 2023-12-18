require_relative "game"

input = File.readlines("day-02/challenge-input.txt")
# input.each { |i| puts i }
games = input.map { |i| GameCreator.new(i).game }
# puts games
# puts "All Games: #{games.map(&:id)}"
possible_games = games.filter { |g| g.possible?({"red" => 12, "green" => 13, "blue" => 14 }) }
# puts "Possible Games: #{possible_games.map(&:id)}"
puts "Sum of possible games: #{possible_games.sum(&:id)}"
puts "Power of minimum cubes for each game: #{games.sum(&:power)}"
