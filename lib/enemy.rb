require_relative './scripts/sprite_render'

class Enemy
  attr_accessor :x, :y, :angle, :image, :vel_x, :vel_y, :dead
  
  def initialize
    @image = ScriptRender.import_sprite('enemy');
  	@vel_x = @vel_y = @angle = 0.0
    @x = 480
    @y = 440
    @default_speed = 4
    @dead = false
  end

  def draw
    @image.draw_rot(@x, @y, ZLayer::ENEMIES, @angle)
  end
  
end