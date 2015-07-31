require_relative '../lib/board'

describe Board do
  let(:ship) { double(:ship, :size => 2) }

  it 'can define coordinates when given a ship, starting cell and direction' do
    cell = [0, 0]
    expect(subject.define_coordinates(ship, cell, 'H')).to eq [[0, 0], [0, 1]]
  end

  it 'places ships on the board' do
    cell = [0, 0]
    subject.place_ship(ship, cell, 'H')
    expect(subject.ship_positions).not_to be_empty
  end

  it 'checks if ships overlap' do
    subject.place_ship(ship, [0, 0], 'H')
    positions = [[0, 0], [1, 0]]
    expect { subject.overlap(positions) }.to raise_error 'There is an overlap'
  end

  it 'checks if ships go beyond board boundaries' do
    positions = [[-5, 9], [9, 9], [10, 9]]
    expect { subject.check_boundaries(positions) }.to raise_error 'Outside Boundaries'
  end

  it 'gets a shoot from the player' do
  end
end