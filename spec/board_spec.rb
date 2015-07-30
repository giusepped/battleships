require_relative '../lib/board'

describe Board do
  let(:ship) { double(:ship, :size => 2) }

  it 'can define coordinates when given a ship, starting cell and direction' do
    cell = [0, 0]
    expect(subject.define_coordinates(ship, cell, 'V')).to eq [[0,0], [1,0]]
  end

end