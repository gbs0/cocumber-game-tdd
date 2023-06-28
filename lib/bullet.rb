require_relative './scripts/sprite_render'

class Bullet
    attr_accessor :x, :y, :radius, :image, :vel_x, :fired
    SPEED = 40 # pixels / second
    SHIP_OFFSET = 25

    def initialize(x, y)
      # self.initialize_sprite
      @image = SpriteRender.import_sprite('bullet')
      @radius = 0.0
      @x = x + SHIP_OFFSET
      @y = y
      @vel_x = SPEED
      @fired = :false
    end

    def build
      fire unless self.fired?
      draw
    end

    def fired?
      @fired
    end

    def fire
      @fired = :true
    end

    # def move
    #   binding.pry
    #   @x += 8 * SPEED
    # end

    def colliding?(enemy); end

    # def update
    #   # move upwards
    #   @y -= SPEED * $game.delta

    #   # collisions against enemies
    #   $game.enemies.each do |enemy|
    #     if self.colliding?(enemy)
    #       # destroy both enemy and bullet
    #       enemy.kill!
    #       self.kill!
    #       $game.score += enemy.points # increase score
    #       $game.fx[:kill].play(0.6) # play explosion sfx
    #     end
    #   end
    #   # destroy the laser when out of the screen
    #   self.kill! if @y < -15
    # end

    def kill!
      $game.player.bullets.delete(self)
    end

    def draw
      @image.draw_rot(@x, @y, ZLayer::BULLET, @radius)
    end

    def accelerate_x
      @x += 8 * @vel_x
    end

  end