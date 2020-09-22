require_relative "lib/window"
require_relative "lib/player"

class Game
  
  def initialize
    @state = :initial
    @window = GameWindow.new
    @player = Player.new
  end

  def update
  end

  def start
    set_state
    draw_window
  end

  def state
    @state
  end

  private
  
  def draw_window
    @window.show
  end

  def set_enemy
    @enemy = []
  end

  def set_state
    @state = :started
  end

end