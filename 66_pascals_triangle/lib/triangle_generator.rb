class TriangleGenerator
  attr_accessor :depth, :triangle

  def initialize(depth)
    @depth = depth
    @triangle = []
  end

  def generate
    raise ArgumentError, 'Depth must be an integer greater than 0' unless depth_valid?
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

  def depth_valid?
    depth >= 1
  end
end
