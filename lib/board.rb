require_relative 'ship'

class Board
  attr_reader :ship_positions, :boundaries
  BOUNDARIES = 10

  def initialize(boundaries = BOUNDARIES)
    @ship_positions = []
    @boundaries = boundaries
    @ships = {}
  end

  def place_ship(ship, cell, direction)
    positions = define_coordinates(ship, cell, direction)
    check_valid_coordinates(positions)
    @ship_positions << positions
  end

  def define_coordinates(ship, cell, direction)
    # we will refactor this later
    coordinates = [cell]
    x = cell[1]
    y = cell[0]
    i = 1
    if direction == 'H'
      (ship.size - 1).times do
        coordinates << [y, (x + i)]
        i += 1
      end
    elsif direction == 'V'
      (ship.size - 1).times do
        coordinates << [(y + i), x]
        i += 1
      end
    end
    coordinates
  end

  def overlap(coordinates)
    fail 'There is an overlap' unless (coordinates & ship_positions.flatten(1)).empty?
  end

  def check_boundaries(coordinates)
    fail 'Outside Boundaries' if coordinates.flatten.any? { |x| x >= boundaries || x < 0 }
  end

  def check_valid_coordinates(coordinates)
    overlap(coordinates)
    check_boundaries(coordinates)
  end

end