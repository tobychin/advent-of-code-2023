require_relative "card"

input = File.readlines("day-04/challenge-input.txt")
cards = input.map { |i| Card.new(i) }
puts "Sum of card points: #{cards.sum(&:points)}"
