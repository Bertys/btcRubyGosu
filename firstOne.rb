require 'gosu'
require "./Player.rb"


class GameWindow < Gosu::Window
  def initialize
    super 1280, 1280, false
    self.caption = "Mi primer juego"
    @player = Player.new(self)
  end
 
  def draw
    @player.draw
  end
 
  def update
    if button_down? Gosu::KbRight
      @player.move_right
    elsif button_down? Gosu::KbLeft
      @player.move_left
    elsif button_down? Gosu::KbUp
      @player.move_up
    elsif button_down? Gosu::KbDown
      @player.move_down
    end
  end

  def needs_cursor
        @player=true
  end
 
end
 
 
window = GameWindow.new
window.show