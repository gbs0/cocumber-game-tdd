class Game
  attr_reader :output, :enemy
  def initialize
    @output = []
    @enemies = %w[Stormtropper Deadpool Trevor]
    @enemy = []
  end

  def start
    @output << "Welcome to the matrix game!"
  end

  def enemy
    @enemy << @enemies[rand(0..@enemies.size)]
  end
end