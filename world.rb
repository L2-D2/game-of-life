class World
  attr_reader :grid

  def initialize(width, height)
    @grid = Array.new(height) { Array.new(width) { Cell.new } }
  end

  def get_neighbors(x:, y:)
    max_y = self.grid.length - 2
    max_x = self.grid.first.length - 2

    [
      (self.grid[y][x+1] if x < max_x),
      (self.grid[y+1][x] if y < max_y),
      (self.grid[y-1][x] if y > 0),
      (self.grid[y][x-1] if y > 0),

      (self.grid[y+1][x-1] if y < max_y && x > 0),
      (self.grid[y+1][x+1] if y < max_y && x < max_x),
      (self.grid[y-1][x+1] if y > 0     && x < max_x),
      (self.grid[y-1][x-1] if y > 0     && x > 0)
    ].compact
  rescue => e
    $debug = true
    require 'pry'; binding.pry if $debug
    $debug = false
  end

end
