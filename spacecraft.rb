class Spacecraft
  attr_accessor :x, :y, :z, :direction, :previous_direction

  DIRECTIONS = {
    'N' => { delta: [0, 1, 0], left: 'W', right: 'E' },
    'S' => { delta: [0, -1, 0], left: 'E', right: 'W' },
    'E' => { delta: [1, 0, 0], left: 'N', right: 'S' },
    'W' => { delta: [-1, 0, 0], left: 'S', right: 'N' },
    'Up' => { delta: [0, 0, 1] },
    'Down' => { delta: [0, 0, -1] }
  }.freeze

  def initialize(x, y, z, direction)
    @x, @y, @z, @direction = x, y, z, direction
    @previous_direction = direction
  end

  def execute_commands(commands)
    commands.each { |command| send("handle_#{command}") }
  end

  private

  def handle_f; move(1); end
  def handle_b; move(-1); end
  def handle_l; turn(:left); end
  def handle_r; turn(:right); end
  def handle_u; change_elevation('Up'); end
  def handle_d; change_elevation('Down'); end

  def move(multiplier)
    dx, dy, dz = DIRECTIONS[@direction][:delta]
    @x += dx * multiplier
    @y += dy * multiplier
    @z += dz * multiplier
  end

  def turn(direction)
    if ['Up', 'Down'].include?(@direction)
      @direction = DIRECTIONS[@previous_direction][direction]
    else
      @direction = DIRECTIONS[@direction][direction]
      @previous_direction = @direction
    end
  end

  def change_elevation(new_direction)
    @direction = new_direction
  end
end

# Usage Example
spacecraft = Spacecraft.new(0, 0, 0, 'N')
spacecraft.execute_commands(%w[f r f l b r u b l u d])
puts "Final Position: (#{spacecraft.x}, #{spacecraft.y}, #{spacecraft.z})"
puts "Final Direction: #{spacecraft.direction}"