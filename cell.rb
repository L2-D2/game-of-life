class Cell
  attr_accessor :lifeyness
  
  def initialize
    @lifeyness = [true, false].sample
  end
  
  def die!
    self.lifeyness = false
  end
  
  def live!
    self.lifeyness = true
  end
  
  def alive?
    lifeyness
  end
end