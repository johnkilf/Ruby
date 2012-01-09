#Author: John Kilfeather
require 'test/unit'
require 'Point.rb'

class TC_Point < Test::Unit::TestCase
	def setup
		@pt = Point.new 2,3 
		@pt2 = Point.new 2,3
	end
	def test_initialize
		#test to string function
		assert(@pt.to_s == "(2,3)", 'to string method not returning expected string')
		#test equality comparison
		assert(@pt == @pt2, 'equality operator not correctly defined')
	end
end

