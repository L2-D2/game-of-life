require './cell'
require './world'

class Game
  attr_accessor :world

  def initialize(width:, height:)
    @world = World.new(width, height)
  end

  def tick
    # traverse map and check surrounding cell state
    whole_new_world = self.world.clone

    world.grid.each_with_index do |row, row_number|
      row.each_with_index do |cell, column_number|
        neighbors = world.get_neighbors(y: row_number, x: column_number)

        # store determined value in new world

        if can_i_be_alive_next_time_please?(neighbors, cell.lifeyness)
          whole_new_world.grid[row_number][column_number].live!
        else
          whole_new_world.grid[row_number][column_number].die!
        end
      end

      # set new world to old world
      self.world = whole_new_world

      # draw

      system "clear"

      world.grid.each do |row|
        row.each do |cell|
          if cell.lifeyness
            print("O")
          else
            print(" ")
          end
        end

        puts
      end
    end
  end

  def can_i_be_alive_next_time_please?(neighbors, alive)
    count = neighbors.select(&:alive?).length

    if alive
      if count == 2 || count == 3
        return true
      else
        return false
      end
    else # we are not alive
      if count == 3
        return true
      else
        return false
      end
    end

  end
end

game = Game.new(width: 50, height: 10)

while true do
  game.tick
  sleep 0.1
end
