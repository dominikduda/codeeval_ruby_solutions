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
    @triangle << [1] if level_number == 1
    @triangle << [1, 1] if level_number == 2
    return if level_number == 1 || level_number == 2
    level = []
    level << 1
    1.upto(level_number - 2) do |i|
      level << triangle.last[i] + triangle.last[i - 1]
    end
    level << 1
    @triangle << level
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
