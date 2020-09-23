require 'pry'
require 'gosu'
require_relative "lib/player"

module ZLayer
  BACKGROUND, SCENARIO, STARTS, PLAYER, UI = *0..4
end

class Game < Gosu::Window
  attr_accessor :player

  def initialize
    super 640, 480
    self.caption = "Gosu Game"

    @state = :initial
    
    @player = Player.new
    
    # @enemies = Enemy.new
    start
  end

  def start
    set_state
    draw
  end

 

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu.button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    
    @player.move
    # @player.collect_stars(@stars)
    
    # if rand(100) < 4 and @stars.size < 25
    #   @stars.push(Star.new(@star_anim))
    # end
  end

  def draw
    binding.pry
    @player.image.draw_rot(@x, @y, ZLayer::PLAYER, @angle)
  end 
  
  def state
    @state
    print("Game is" + @state)
  end

  private
  
  def set_enemy
    @enemy = []
  end

  def set_state
    @state = :started
  end

end

Game.new if __FILE__ == $0