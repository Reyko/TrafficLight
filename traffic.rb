require 'my_lib.rb'

class TrafficLight  
  include Enumerable

  def each
    yield [true, false, false]
    yield [true, true, false]
    yield [false, false, true]
    yield [false, true, false]
  end
end

class Bulb < Shoes::Shape
  attr_accessor :stack
  attr_accessor :left
  attr_accessor :top
  attr_accessor :switched_on
  
  def initialize(stack, left, top, switched_on = false)    
    self.stack = stack
    self.left = left    
    self.top = top
    self.switched_on = switched_on
    draw left, top, bulb_colour
  end
  
  # HINT: Shouldn't need to change this method
  def draw(left, top, colour)    
    stack.app do
      fill colour
      stack.append do
        oval left, top, 50
      end
    end
  end
  

  def bulb_colour 
    "#999999"
  end  

  #def switched_off
   #switched_on = switched_on
    #draw left, top, "#999999"
  #end

end

class GoBulb < Bulb

  def bulb_colour
    if switched_on
       TL::Go
    else
      super
    end
  end  

end

class WaitBulb < Bulb

  def bulb_colour
    if switched_on
      TL::Wait
    else
      super
    end
  end  
end

class StopBulb < Bulb

  def bulb_colour
    if switched_on
      TL::Stop
    else
      super
    end
  end  
end


Shoes.app :title => "My Amazing Traffic Light", :width => 150, :height => 250 do
  background "000", :curve => 10, :margin => 25  
  stroke black    
  
  @traffic_light = TrafficLight.new
  
  
  #@top = Bulb.new self, 50, 40, true     
  #@middle = Bulb.new self, 50, 100, true
  #@bottom = Bulb.new self, 50, 160, true
  
  @top = GoBulb.new self, 50,40,false
  @middle = WaitBulb.new self,50,100,false
  @bottom = StopBulb.new self,50,160,true

  #@top.switched_off  
  #@middle.switched_off

  click do
    
    


  end
end




