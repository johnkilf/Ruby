#Author: John Kilfeather
require 'Terrain.rb'
require 'Point.rb'
require 'MatrixStats.rb'

class SwimmingPool
	include MatrixStats

	def initialize terrain, size
		@terrain = terrain
		@size = size
		@numbers = Array.new(size) {Array.new(size)}
	end
	
	def find_location
		max = @terrain.size - @size


		#get mean of first possible location
		best_location = Point.new 0, 0
		getPlot 0, 0
		best_mean = mean
		best_dev = std_dev

		#iterate through each location calculating the mean at that point
		#and comparing it to the best mean found thus far
		(0..max).each do |i|
			(max+1).times do |j|
				getPlot i, j
				plot_mean = mean

				if plot_mean < best_mean
					best_location.x = i
					best_location.y = j
					best_mean = plot_mean
					best_dev = std_dev
				elsif plot_mean == best_mean
					plot_dev = std_dev
					if plot_dev < std_dev
						best_location.x = i
						best_location.y = j
						best_mean = plot_mean
						best_dev = plot_dev
					end
				end
			end
		end
		#return location (top left)
		best_location
	end

	#stores the plot at location x y in parent terrain into @numbers
	def getPlot x, y
		@size.times do |i|
			@size.times do |j|
				@numbers[i][j] = @terrain.numbers[x+i][y+j]
			end
		end
	end
end
