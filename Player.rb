
class Player
  def initialize(window)
     @x = 1
     @y = 1
    @image = Gosu::Image.new(window, "./images/mine.png", true)
  end
  def draw()
    @image.draw(@x, @y, 0)
  end
  def move_right()
    @x = @x + 10
  end
  def move_left()
    @x = @x - 10
  end
  def move_up()
    @y = @y - 10
  end
  def move_down()
    @y = @y + 10
  end
 
end