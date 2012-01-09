#Author: John Kilfeather
module MatrixStats
#computes stats for class with 2d matrix @numbers of size @size

	def mean
		mean = 0.0;
		@numbers.each do |i| #sum all objects
			mean += i.inject{|acc,j| acc + j}
		end
		mean = mean / @size**2 #divide by total objects
	end

	def std_dev
		std_dev = 0.0
		avg = mean
		@numbers.each do |i| #sum square differences
			std_dev += i.inject(0){ |acc, j| acc + ((j-avg)**2)}
		end
		std_dev = Math.sqrt(std_dev / (@size**2)) #divide by total objects and get square root
	end

	def to_s
		output = "Size: #{@size}\n"
		@numbers.each do |row|
			row.each {|cell| output += "#{cell} "}
			output += "\n"
		end
		output
	end

end

