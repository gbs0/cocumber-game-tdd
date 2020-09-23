require 'pry'
require 'gosu'
require_relative "lib/player"
require_relative "lib/shield"

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

    @shields = Shield.new
    
    # @enemies = Enemy.new
    #start
  end

  def start
    set_state
    draw
  end

  def update
    if Gosu.button_down? Gosu::KB_A or Gosu.button_down? Gosu::GP_LEFT
      @player.accelerate_x
    end
    if Gosu.button_down? Gosu::KB_D or Gosu.button_down? Gosu::GP_RIGHT
      @player.accelerate_x
    end
    if Gosu.button_down? Gosu::KB_W or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.accelerate_y
    end
    if Gosu.button_down? Gosu::KB_S or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.accelerate_y
    end
    
    @player.move
    # @player.collect_stars(@stars)
    
    # if rand(100) < 4 and @stars.size < 25
    #   @stars.push(Star.new(@star_anim))
    # end
  end

  def draw
    @player.draw
    @shields.each { |shield| shield.draw }
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

Game.new.show if __FILE__ == $0