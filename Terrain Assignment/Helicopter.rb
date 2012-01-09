#Author: John Kilfeather
require 'Terrain.rb'
require 'MatrixStats.rb'
require 'Square.rb'

class Helicopter
	include MatrixStats

	def initialize terrain
		@terrain = terrain
	end

	
	def find_location
		biggest_square = Square.new 0, 0, 0, 0;
		#2d array storing the biggest square possible at each location
		count = Array.new(@terrain.size) {Array.new(@terrain.size)}
		#iterate over matrix from bottom right to top left
		(@terrain.size-1).downto(0).each do |i|
			(@terrain.size-1).downto(0).each do |j|
				#assign square size to squares on bottom & right edges to 1
				if i == @terrain.size-1 || j== @terrain.size-1
					count[i][j] = Square.new i, j, 1, @terrain.numbers[i][j]
				else
					#if the squares below, right, and below right of the current square have the same value as it
					#assign the square the minimum of their sizes + 1
					#otherwise assign it size 1

					sq_value = @terrain.numbers[i][j]#current square value

					below = count[i+1][j].value  == sq_value ? count[i+1][j].size : 0
					right = count[i][j+1].value  == sq_value ? count[i][j+1].size : 0
					below_right = count[i+1][j+1].value  == sq_value ? count[i+1][j+1].size : 0

					sq_size = [below, right, below_right].min + 1

					#create the appropriate square for the location
					count[i][j] = Square.new i, j, sq_size, sq_value
		
					#if current square is bigger than biggest square replace biggest square with current square
					if count[i][j].size > biggest_square.size || (count[i][j].size == biggest_square.size && count[i][j].value > biggest_square.value)
						biggest_square.copy(count[i][j])
					end

				end
			end
		end
		#return the biggest square
		biggest_square
	end

end
