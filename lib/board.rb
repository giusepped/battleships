require_relative 'ship'

class Board

  def initalize
    @ship_positions = []
  end

  def define_coordinates(ship, cell, direction)
    #we will refactor this later
    coordinates = [cell]
    x = cell[1]
    y = cell[0]
    i = 1
    if direction == 'H'
      (ship.size-1).times do
        coordinates << [y, (x+i)]
        i+=1
      end
    elsif direction == 'V'
      (ship.size-1).times do
        coordinates << [(y+i), x]
        i+=1
      end
    end
    coordinates
  end

end