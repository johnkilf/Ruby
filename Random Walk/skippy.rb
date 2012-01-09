#!/usr/bin/env ruby

###############################################
#	skippy.rb																		#				
# Simulates a random walk within a grid				#
#	Author: John Kilfeather											#
#	Last Updated: 6/10/2011											#
###############################################

#Die represents a four sided die with four faces :NORTH, :SOUTH, :EAST, :WEST
#The class also holds stats for how often each option is rolled
class Die
	# Set all counts to 0
  def initialize
		@counts = {:NORTH => 0, :SOUTH => 0, :EAST => 0, :WEST => 0}
  end

	#throw_die - randomly returns :NORTH, :SOUTH, :EAST, or :WEST with equal probability
	#also increments the appropriate count
	def throw_die
		case rand(4)
		when 0
			@counts[:NORTH] += 1
			:NORTH
		when 1
			@counts[:SOUTH] += 1
			:SOUTH
		when 2
			@counts[:EAST] += 1
			:EAST
		when 3
			@counts[:WEST] += 1
			:WEST
		end
	end

	#returns the counts of each possible throw
	def stats
		@counts
	end

end

#Point represents a point in 2 dimensional space, it has an x and y value which both have accessors
class Point
	#Initial x and y values required to create object
	def initialize x, y
		@x = x
		@y = y
	end

	attr_accessor :x
	attr_accessor :y

	#prints the point in a legible form eg: (4,5)
	def print
		puts "(#{@x}," + "#{@y})"
	end
end

#Kangaroo represents a Kangaroo which moves within a grid in the x y plane taking hops in random directions
class Kangaroo
 	#starting point is set to (0,0)
	def initialize dimension, die
		@location = Point.new 0, 0
		@dimension = dimension
		@die = die
	end

	#randomly hops skippy in a legal direction
	def hop!
		#loop throws die until a direction that will not bring skippy outside the boundary is found
		begin
			newpoint = @location.clone
			direction = @die.throw_die
			case direction
				when :NORTH
					newpoint.y = newpoint.y + 1
				when :SOUTH
					newpoint.y = newpoint.y - 1
				when :EAST
					newpoint.x = newpoint.x + 1
				when :WEST
					newpoint.x = newpoint.x - 1
			end	
		end while newpoint.y > @dimension-1 || newpoint.y < 0 || newpoint.x > @dimension-1 || newpoint.x < 0
		@location = newpoint.clone
	end

	#returns true if kangaroo is on one of the edges of the grid
	def at_boundary?
		if @location.x == 0 || @location.x == @dimension-1 || @location.y == 0 || @location.y == @dimension-1
			true
		else
			false
		end
	end
	
	#returns true if kangaroo is at furthest point from origin (dimension-1, dimension-1) 
	def at_home?
		if @location.x == @dimension - 1 && @location.y == @dimension - 1
			true
		else
			false
		end
	end

	#accessor for kangaroo's location
	def location
		@location
	end

end

#RandomWalk performs a random walk of a kangaroo within a grid of a given dimension until end point is reached
#It tracks the number of hops required in the walk
class RandomWalk

	def initialize dimension
		@dimension = dimension
		@die = Die.new
		@roo = Kangaroo.new @dimension, @die
		@no_of_hops = 0
	end

	#performs the walk - printing each location along the route
	def start!
		while !@roo.at_home?
			@roo.hop!		
			@no_of_hops+=1
			@roo.location.print
		end
	end

	#returns the kangaroos location
	def final_location
		@roo.location
	end

	#accessor for no_of_hops
	def no_of_hops
		@no_of_hops
	end

	#returns the stats from the die
	def stats
		@die.stats
	end

end

if __FILE__ == $0

#ensure user has supplied argument to program
if ARGV[0] == nil || ARGV[0].to_i <= 0
	puts "Error: Program must be called with a positive integer argument for dimension of grid eg:"
	puts ":ruby skippy.rb 10"
else

#create a random walk using ARGV[0] as the dimension
test = RandomWalk.new ARGV[0].to_i
#start the walk
test.start!

#print results:
puts "Number of hops: #{test.no_of_hops}"

#calculate percentage of total rolls for each dice face rounded to nearest integer
#percentages stored in hash table percentage_rolls with same keys (:NORTH, :SOUTH, :EAST, :WEST)
percentage_rolls = {}
total = test.stats[:NORTH] + test.stats[:SOUTH] + test.stats[:EAST] + test.stats[:WEST]
test.stats.each do |key, val|
	#ensure no division errors by checking if there were 0 rolls of that type
	if val > 0
		percentage_rolls[key] = (val * 100.0 / total).round
	else
		percentage_rolls[key] = 0
	end
end

puts "North #{percentage_rolls[:NORTH]}%, South #{percentage_rolls[:SOUTH]}%, East #{percentage_rolls[:EAST]}%, West #{percentage_rolls[:WEST]}%"

end

end
