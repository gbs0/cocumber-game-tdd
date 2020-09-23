class Player
	attr_accessor :x, :y, :angle, :image
  
	attr_reader :score
  
  def initialize
  	@image = Gosu::Image.new("media/player.png");
  	@x = @y = @vel_x = @vel_y = @angle = 0.0
  	@score = 0
  end

  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5)
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

end