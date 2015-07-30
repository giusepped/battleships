require_relative 'ship'

class Board

  def define_coordinates(ship, cell, direction)
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