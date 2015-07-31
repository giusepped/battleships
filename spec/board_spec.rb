require_relative '../lib/board'

describe Board do
  let(:ship) { double(:ship, :size => 2) }

  it 'can define coordinates when given a ship, starting cell and direction' do
    cell = [0, 0]
    expect(subject.define_coordinates(ship, cell, 'H')).to eq [[0, 0], [1, 0]]
  end

  it 'places ships on the board' do
    cell = [0, 0]
    subject.place_ship(ship, cell, 'H')
    expect(subject.ship_positions).not_to be_empty
  end

  it 'checks if ships overlap' do
    subject.place_ship(ship, [0, 0], 'H')
    positions = [[0, 0], [1, 0]]
    expect { subject.overlap(positions) }.to raise_error 'Invalid position'
  end

  it 'checks if ships go beyond board boundaries' do
    positions = [[-5, 9], [9, 9], [10, 9]]
    expect { subject.check_boundaries(positions) }.to raise_error 'Invalid position'
  end

  describe '#get_shot' do
    cells = [0, 0], [9, 9]
    it 'can get shot and, if hit, the hit is recorded' do
      allow(ship).to receive(:get_hit)
      subject.place_ship(ship, cells[0], 'H')
      subject.get_shot(cells[0])
      expect(subject.hits).to eq [cells[0]]
    end

    it 'calls the get_hit method on the ship that has been hit' do
      subject.place_ship(ship, cells[0], 'H')
      expect(ship).to receive(:get_hit)
      subject.get_shot(cells[0])
    end

    it 'can get shot and, if missed, the miss is recorded' do
      subject.place_ship(ship, cells[0], 'H')
      subject.get_shot(cells[1])
      expect(subject.misses).to eq [cells[1]]
    end
  end
end