class World
  attr_reader :grid
  
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) { Cell.new } }
  end
  
  def get_neighbors(x:, y:)
    max = self.grid.length - 1
    [
      (self.grid[x][y+1] if y < max),
      (self.grid[x+1][y] if x < max),
      (self.grid[x-1][y] if x > 0),
      (self.grid[x][y-1] if y > 0),
      
      (self.grid[x+1][y-1] if x < max && y > 0),
      (self.grid[x+1][y+1] if x < max && y < max),
      (self.grid[x-1][y+1] if x > 0   && y < max),
      (self.grid[x-1][y-1] if x > 0   && y > 0)
    ].compact
  end
  
end