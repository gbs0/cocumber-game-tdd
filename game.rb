class Game
  attr_reader :output
  def initialize
    @output = []
  end
  
  def start
    @output << "Welcome to the matrix game!"
  end
end