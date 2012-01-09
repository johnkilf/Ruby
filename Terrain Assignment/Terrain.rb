#Author: John Kilfeather
require 'Point.rb'
require 'MatrixStats.rb'

class Terrain
	include MatrixStats
	attr_reader :size, :numbers

	def initialize size, numbers
		@size = size
		@numbers = Array.new(numbers)		
	end

	def highest_point
		#note- only returns a single highest point, even if more than one point has the same height

		#iterates through numbers storing the highest point's location and value
		highest = @numbers[0][0]
		point = Point.new 0, 0

		@numbers.each_with_index do |x, xi|
  		x.each_with_index do |y, yi|
   			if y > highest
					highest = y
					point.x = xi
					point.y = yi
				end
			end
		end
		#return location
		point
  end
end



