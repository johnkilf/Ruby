#Author: John Kilfeather
#Point represents a point in 2 dimensional space, it has an x and y value
class Point
	attr_accessor :x
	attr_accessor :y

	#Initial x and y values required to create object
	def initialize x, y
		@x = x
		@y = y
	end

	#Returns the point in a legible form eg: (4,5)
	def to_s
		"(#{@x},#{@y})"
	end
	
	#comparison operator 
	def == (another_point)
    self.x == another_point.x && self.y == another_point.y
  end
end
