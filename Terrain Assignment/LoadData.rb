#Author: John Kilfeather
class LoadData	

	attr_reader :terrain_size, :terrain_numbers, :pool_size

	def initialize filename
		@terrain_numbers = Array.new
		data = File.open(filename, 'r') do |inputFile|
			@terrain_size = inputFile.gets.to_i 

			@terrain_size.times do |i| #get several lines of numbers
				@terrain_numbers[i] = inputFile.gets.split #break line of numbers into individual numbers
				@terrain_numbers[i].map!{|j| j.to_i} #convert from strings to ints
			end
			@pool_size = inputFile.gets.to_i
		end
	end

end

