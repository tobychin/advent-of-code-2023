require "yaml"
require_relative "calibrate"

input = YAML.load(File.read("input.yaml")).split(" ")
c = Calibrate.new(input)
# puts ("Values: #{c.values.join(', ')}")
puts ("Sum: #{c.sum}")