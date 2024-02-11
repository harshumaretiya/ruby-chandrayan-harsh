require_relative '../spacecraft'

RSpec.describe Spacecraft do
  it 'initializes with x, y, z coordinates and direction' do
    spacecraft = Spacecraft.new(0, 0, 0, 'N')
    expect(spacecraft.x).to eq(0)
    expect(spacecraft.y).to eq(0)
    expect(spacecraft.z).to eq(0)
    expect(spacecraft.direction).to eq('N')
  end
end
