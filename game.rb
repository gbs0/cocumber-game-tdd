require_relative "lib/window"
require_relative "lib/player"

class Game
  
  def initialize
    @state = :initial
    
    @window = GameWindow.new
    @player = Player.new
    
    # @enemies = Enemy.new
    start
  end

  def update
   
  end

  def start
    set_state
    draw
  end

  def state
    @state
  end

  private
  
  def draw
    @window.show.draw(@player)
  end

  def set_enemy
    @enemy = []
  end

  def set_state
    @state = :started
  end

end

Game.new.show if __FILE__ == $0