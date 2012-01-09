#Author: John Kilfeather
require 'Point.rb'
#represents a square with a size, location, and value
class Square
	attr_accessor :location, :size, :value
	def initialize x, y, size, value
		@size = size
		@value = value
		@location = Point.new(x,y)
	end

	def copy source
		@size = source.size
		@value = source.value
		@location.x = source.location.x
		@location.y = source.location.y
	end

	def to_s
		"Location #{location.to_s}, Size #{size}, Value #{value}"
	end
end
