require_relative 'Spacecraft'

class SpacecraftTest
  def self.run_all_tests
    puts "Running tests..."
    new.test_forward_and_turn
    new.test_up_and_down
    new.test_backward
    puts "All tests completed."
  end

  def test_forward_and_turn
    spacecraft = Spacecraft.new(0, 0, 0, 'N')
    spacecraft.execute_commands(%w[f r f l f])
    assert_equal([2, 1, 0], [spacecraft.x, spacecraft.y, spacecraft.z], "Test Forward and Turn")
    assert_equal('N', spacecraft.direction, "Test Forward and Turn")
  end

  def test_up_and_down
    spacecraft = Spacecraft.new(0, 0, 0, 'N')
    spacecraft.execute_commands(%w[u r d l])
    assert_equal([0, 0, 0], [spacecraft.x, spacecraft.y, spacecraft.z], "Test Up and Down")
    assert_equal('W', spacecraft.direction, "Test Up and Down")
  end

  def test_backward
    spacecraft = Spacecraft.new(0, 0, 0, 'E')
    spacecraft.execute_commands(%w[b l b r b])
    assert_equal([-1, -1, 0], [spacecraft.x, spacecraft.y, spacecraft.z], "Test Backward")
    assert_equal('W', spacecraft.direction, "Test Backward")
  end

  def assert_equal(expected, actual, test_name)
    if expected == actual
      puts "#{test_name}: Passed"
    else
      puts "#{test_name}: Failed (Expected #{expected}, but got #{actual})"
    end
  end
end