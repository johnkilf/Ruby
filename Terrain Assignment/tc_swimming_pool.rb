#Author: John Kilfeather
require 'test/unit'
require 'SwimmingPool.rb'

class TC_SwimmingPool < Test::Unit::TestCase
	def setup
		numbers = Array[[9,8,6],[4,3,2],[8,2,3]]
		@terr = Terrain.new 3, numbers
		@pool = SwimmingPool.new @terr, 2
		@best = Point.new(1,1)
	end

	def test_initialize
		assert(@pool.find_location == @best, 'best location not calculated correctly')
	end
end

