#Author: John Kilfeather
require 'test/unit'
require 'Terrain.rb'

class TC_Terrain < Test::Unit::TestCase
	def setup
		numbers = Array[[1,2],[4,3]]
		@terr = Terrain.new 2, numbers
		@highest = Point.new(1,0)
	end

	def test_initialize
		#test highest point
		assert(@terr.highest_point == @highest, 'highest point not calculated correctly')
	end
end

