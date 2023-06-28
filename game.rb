require 'pry'
require 'gosu'
require_relative "lib/player"
require_relative "lib/shield"
require_relative "lib/modules/z_layer"
require_relative "lib/modules/rigid_body"

class Game < Gosu::Window

  include ZLayer
  attr_accessor :player, :phase

  def initialize
    super 640, 480
    self.caption = "Gosu Game"
    @state = :initial
    @player = Player.new
    @phase = :first
    @shields = [Shield.new]
    # @enemies = Enemy.builder(@phase)
    # @enemies = Enemy.new
    #start
  end

  def start
    set_state
    draw
  end

  def update 
    @player.update
    # unless !@player.bullets.empty?
    #   @player.bullets.each { |bullet| bullet.move }
    # end
    # @player.collect_stars(@stars)
    
    # if rand(100) < 4 and @stars.size < 25
    #   @stars.push(Star.new(@star_anim))
    # end

    check_collisions
    puts "Player Stats | X: #{@player.x} | Y: #{@player.y} | RADIUS: #{@player.radius}"
    @shields.each do |shield|
      puts "Shield Stats | X: #{shield.x} | Y: #{shield.y} | RADIUS: #{shield.radius}"
    end
  end

  def draw
    inputs
    @player.draw
    @shields.each { |shield| shield.draw }
    # @enemies.draw
  end 
  
  def state
    @state
    puts("Game is" + @state)
  end

  private
  
  def set_enemy
    @enemy = []
  end

  def set_state
    @state = :started
  end
  
  def check_collisions
    @shields.each do |shield| # Verify if player intersects with shield
      if @player.collide?(shield)
        puts "Collide with #{shield.class.to_s}"
      end
    end
  end

  def inputs
    if Gosu.button_down? Gosu::KB_A or Gosu.button_down? Gosu::GP_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_D or Gosu.button_down? Gosu::GP_RIGHT
      @player.move_right
    end
    if Gosu.button_down? Gosu::KB_W or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.move_up
    end
    if Gosu.button_down? Gosu::KB_S or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.move_down
    end
    
    @player.shoot if Gosu.button_down? Gosu::KB_SPACE
    close if Gosu.button_down? Gosu::KB_ESCAPE
  end

end

Game.new.show if __FILE__ == $0