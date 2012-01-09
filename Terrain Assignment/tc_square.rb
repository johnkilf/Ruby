#Author: John Kilfeather
require 'test/unit'
require 'Square.rb'

class TC_Square < Test::Unit::TestCase
	def setup
		@sqr1 = Square.new 2,3,4,5
		@pt = Point.new 2,3
		@sqr2 = Square.new 1,1,1,1
	end

	def test_initialize
		#test initialization
		assert(@sqr1.location == @pt, 'location not equal to value it was initialized with')
		assert(@sqr1.size == 4, 'square size not equal to value it was initialized with')
		assert(@sqr1.value == 5, 'square value not equal to value it was initialized with')
		#copy square
		@sqr2.copy @sqr1
		#test copied correctly
		assert(@sqr2.location == @sqr1.location && @sqr2.size == @sqr1.size && @sqr2.value == @sqr1.value, 'copy function not working as expected')
		#test to string method
		assert(@sqr1.to_s == "Location #{@pt.to_s}, Size 4, Value 5")
	end
end

