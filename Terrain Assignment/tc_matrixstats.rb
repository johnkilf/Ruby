#Author: John Kilfeather
require 'test/unit'
require 'MatrixStats.rb'

#create class that extends module just for testing
class TestMatrix
	include MatrixStats
	attr_accessor :size
	def initialize size, values
		@size = size
		@numbers = Array.new(values)
	end
end

class TC_MatrixStats < Test::Unit::TestCase
	def setup
		numbers = Array[[1,1],[5,5]]
		@mtrx = TestMatrix.new 2, numbers
	end

	def test_initialize
		#test mean
		assert(@mtrx.mean == 3, 'mean not calculated correctly')
		#test standard deviation
		assert(@mtrx.std_dev == 2, 'standard deviation not calculated correctly')
	end

end


