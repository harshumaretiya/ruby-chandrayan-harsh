class Spacecraft
  attr_accessor :x, :y, :z, :direction

  def initialize(x, y, z, direction)
    @x, @y, @z, @direction = x, y, z, direction
  end

  DIRECTIONS = {
    'N' => { delta: [0, 1, 0], left: 'W', right: 'E' },
    'S' => { delta: [0, -1, 0], left: 'E', right: 'W' },
    'E' => { delta: [1, 0, 0], left: 'N', right: 'S' },
    'W' => { delta: [-1, 0, 0], left: 'S', right: 'N' }
  }.freeze

  def execute_commands(commands)
    commands.each { |command| send("handle_#{command}") }
  end

  private

  def handle_f
    dx, dy, dz = DIRECTIONS[@direction][:delta]
    @x += dx
    @y += dy
    @z += dz
  end

  def handle_r
    @direction = DIRECTIONS[@direction][:right]
  end

  def handle_l
    @direction = DIRECTIONS[@direction][:left]
  end
end
