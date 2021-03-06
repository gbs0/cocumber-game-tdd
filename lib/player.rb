class Player
	attr_accessor :x, :y, :angle, :image, :vel_x, :vel_y
  
	attr_reader :score
  
  def initialize
  	@image = Gosu::Image.new("media/player.png");
  	@x = @y = @vel_x = @vel_y = @angle = 0.0
  	@score = 0
  end

  def accelerate_x
    @vel_x += Gosu.offset_x(@angle, 0.5)
  end

  def accelerate_y
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end

  def move
  	@x += @vel_x
  	@y += @vel_y
  	@x %= 640
  	@y %= 480
  end

  def collect_shield(shield)
    
  end
  
  def draw
  	@image.draw_rot(100, 240, ZLayer::PLAYER, @angle)
  end
end