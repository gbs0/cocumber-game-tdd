require_relative "lib/window"
require 'pry'
require_relative "lib/player"

class Game
  attr_accessor :player

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

  def draw
    binding.pry
    @window.show.draw(@player)

  end
  
  def state
    @state
  end

  private
  
  def set_enemy
    @enemy = []
  end

  def set_state
    @state = :started
  end

end

Game.new.show if __FILE__ == $0