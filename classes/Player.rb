# Player initializer

class Player
  attr_accessor :name, :life

  def initialize(name)
    @life = 3
    @name = name
  end

  def minuslife
    @life -= 1
  end
end