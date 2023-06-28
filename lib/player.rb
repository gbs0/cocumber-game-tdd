require_relative './scripts/sprite_render'
require_relative 'bullet'
require 'pry'

class Player
  attr_accessor :x, :y, :angle, :image, :vel_x, :vel_y, :dead, :active_shield, :bullets
  
	# attr_reader :score

  def initialize
  	@image = SpriteRender.import_sprite('player')
  	@vel_x = @vel_y = @angle = 0.0
    @x = 100
    @y = 240
    @default_speed = 8
  	@score = 0
    @dead = false
    @active_shield = false
    @bullets = []
    @fire_rate = 0.5
  end

  # def accelerate_x
  #   # @vel_x += Gosu.offset_x(@angle, 0.5)
  # end

  # def accelerate_y
  #   # @vel_y += Gosu.offset_y(@angle, 0.5)
  # end
  
  def move_up
    @y -= @default_speed
  end

  def move_down
    @y += @default_speed
  end

  def move_left
    @x -= @default_speed
  end

  def move_right
    @x += @default_speed
  end

  def move
  	@x += @vel_x
  	@y += @vel_y
    # @x %= 380 # Position Loop in X axis
  	# @y %= 480 # Position Loop in Y axis
    @x = [[@x, 300].min, 30].max
    @y = [[@y, 460].min, 20].max
  end

  def collect_shield(shield)
    # @image = SpriteRender.import_sprite('player_shield')

    # Counter
  end

  def shoot
    bullet = Bullet.new(@x, @y)
    @bullets << bullet
    while bullet.fired?
      bullet.accelerate_x
    end
  end
  
  def draw
  	@image.draw_rot(@x, @y, ZLayer::PLAYER, @angle)
  end

  def destroy; end

  def lower_firerate
    @fire_rate -= 0.001
  end

  def increase_firerate
    @fire_rate += 0.001
  end
end