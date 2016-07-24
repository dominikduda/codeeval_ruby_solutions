require 'pry'

class TriangleGenerator
  attr_accessor :triangle
  attr_reader :depth

  def initialize(depth)
    @depth = depth
    @triangle = []
  end

  def depth=(argument)
    raise ArgumentError, 'Depth must be an integer greater than 0' unless depth_valid?(argument)
    @depth = argument
  end

  def generate
    @triangle = []
    1.upto(depth) { |level_number| add_level(level_number) }
    @triangle.flatten.join(' ')
  end

  private

  def add_level(level_number)
    case level_number
    when 1 then @triangle << [1] if level_number == 1
    when 2 then @triangle << [1, 1] if level_number == 2
    else @triangle << level(level_number)
    end
  end

  def level(level_number)
    layer = [1]
    1.upto(level_number - 2) { |i| layer << last_level_node(i) }
    layer << 1
    layer
  end

  def last_level_node(node_number)
    triangle.last[node_number] + triangle.last[node_number - 1]
  end

  def depth_valid?(depth)
    depth >= 1 && depth % 1 == 0
  end
end

# input = File.open(ARGV[0]).readlines.map(&:to_i)
# triangle_generator = TriangleGenerator.new(0)
# input.each do |integer|
#   triangle_generator.depth = integer
#   puts triangle_generator.generate
# end
