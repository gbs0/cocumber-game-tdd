class Shield
  attr_accessor :x, :y

  def initialize
  	@image = Gosu::Image.new("media/shield.png");
  	@x = rand * 630
  	@y = rand * 470
  end

  def draw
    
    @image.draw(@x / 2.0, @y / 2.0,
        ZLayer::STARS, 1, 1)
  end
end