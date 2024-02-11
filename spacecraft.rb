class Spacecraft
  attr_accessor :x, :y, :z, :direction

  def initialize(x, y, z, direction)
    @x, @y, @z, @direction = x, y, z, direction
  end
end
