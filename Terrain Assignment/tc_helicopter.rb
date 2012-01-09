#Author: John Kilfeather
require 'test/unit'
require 'Helicopter.rb'

class TC_Helicopter < Test::Unit::TestCase
	def setup
		numbers = Array[[1,1,3,4],[1,1,2,2],[7,5,2,2],[1,2,3,4]]
		@terr = Terrain.new 4, numbers
		@heli = Helicopter.new @terr
		@best_sqr = Square.new 1, 2, 2, 2
	end

	def test_initialize
		square = @heli.find_location
		assert(square.location == @best_sqr.location && square.size == @best_sqr.size && square.value == @best_sqr.value, 'best location not calculated correctly')
	end
end

