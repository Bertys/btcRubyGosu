class Player

    attr_reader :score

  def initialize
    @image = Gosu::Image.new("images/mineLittle.png")
    @beep = Gosu::Sample.new("images/beep.wav")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end
  
  def move
    puts @x
      puts @y

    if @x<620 && @x>20 && @y<460 && @y>20
      @x += @vel_x
      @y += @vel_y
      @x %= 640
      @y %= 480
      
      @vel_x *= 0.95
      @vel_y *= 0.95

      
    elsif @x>620
      @x=619
    elsif @x<20
      @x=21
    elsif @y>460
      @y=459
    elsif @y<20
      @y=21
    else
      # puts "balalal"
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def score
    @score
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu.distance(@x, @y, star.x, star.y) < 35
        @score += 10
        @beep.play
        true
      else
        false
      end
    end
  end
end