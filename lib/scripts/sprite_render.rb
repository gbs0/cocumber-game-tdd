class SpriteRender
  def initialize; end
  
  def self.import_sprite(sprite_name)
    return Gosu::Image.new("media/#{sprite_name}.png")
  end
end