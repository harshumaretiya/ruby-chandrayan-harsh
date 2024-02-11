require_relative '../spacecraft'

RSpec.describe Spacecraft do
  describe 'initialization' do
    subject(:spacecraft) { Spacecraft.new(0, 0, 0, 'N') }

    it 'initializes with x, y, z coordinates and direction' do
      expect(spacecraft.x).to eq(0)
      expect(spacecraft.y).to eq(0)
      expect(spacecraft.z).to eq(0)
      expect(spacecraft.direction).to eq('N')
    end
  end

  # Additional tests for movement and turning
  describe 'movement' do
    it 'moves forward' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.execute_commands(['f'])
      expect(spacecraft.y).to eq(1)
    end

    it 'turns right' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.execute_commands(['r'])
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns left' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N')
      spacecraft.execute_commands(['l'])
      expect(spacecraft.direction).to eq('W')
    end
  end
end


