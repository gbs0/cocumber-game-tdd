require 'gosu'

module ZLayer
  BACKGROUND, SCENARIO, STARTS, PLAYER, UI = *0..3
end

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Gosu Game"

  end

  def draw(player)
    player.draw
  end
end