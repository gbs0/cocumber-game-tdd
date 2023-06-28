class Shield
  attr_accessor :x, :y, :radius

  def initialize
  	@image = Gosu::Image.new("media/shield_item.png");
  	@x = rand * 630
  	@y = rand * 470
  end

  def draw
    @image.draw_rot(@x / 2.0, @y / 2.0, ZLayer::SHIELD, 1)
    # angle = (Gosu::milliseconds / 15) % 360
    # @image.draw_rot(@x, @y, ZOrder::Ship, angle, 0.5, 0.5, 0.75, 0.75, 0xff3366ff)
  end

  def radius
    25
  end
    
  def update # Method to put shield in player's ship
    @x = @ship.x
    @y = @ship.y
  end
  
  def collide?(object)
    RigidBody.collide?(self, object)
  end
end