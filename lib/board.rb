require_relative 'ship'

class Board
  attr_reader :ship_positions, :boundaries, :hits, :misses
  BOUNDARIES = 10

  def initialize(boundaries = BOUNDARIES)
    @ship_positions = []
    @boundaries = boundaries
    @ship_hash = {}
    @hits = []
    @misses = []
  end

  def place_ship(ship, cell, direction)
    positions = define_coordinates(ship, cell, direction)
    check_valid_coordinates(positions)
    @ship_positions += positions
  end

  def define_coordinates(ship, cell, direction)
    x = cell[1]
    y = cell[0]
    if direction == 'H'
      return (0..ship.size - 1).map{ |element| [x + element, y] }
    else
      return (0..ship.size - 1).map{ |element| [x, y + element] }
    end
    coordinates
  end

  def overlap(coordinates)
    fail 'There is an overlap' unless (coordinates & ship_positions).empty?
  end

  def check_boundaries(coordinates)
    fail 'Outside Boundaries' if coordinates.flatten.any? { |x| x >= boundaries || x < 0 }
  end

  def check_valid_coordinates(coordinates)
    overlap(coordinates)
    check_boundaries(coordinates)
  end

  def get_shot(cell)
    ship_positions.include?(cell) ? @hits << cell : @misses << cell
  end

end