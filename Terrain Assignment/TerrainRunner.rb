#Author: John Kilfeather
#Program to create and run the various classes associated with the assignment

require 'LoadData.rb'
require 'Terrain.rb'
require 'SwimmingPool.rb'
require 'Helicopter.rb'

#load data from file
data = LoadData.new "terrain.dat"

#set parameters from data
terrain = Terrain.new data.terrain_size, data.terrain_numbers
pool = SwimmingPool.new terrain, data.pool_size
helicopter = Helicopter.new terrain
data = nil



puts "\nTERRAIN:"
puts "Highest point is: #{terrain.highest_point.to_s}"
puts "Mean is: #{terrain.mean}"
puts "standard deviation is: #{terrain.std_dev}"

puts "\nPOOL"
puts "Location: #{pool.find_location.to_s}"

puts "\nHELICOPTER"
puts "#{helicopter.find_location.to_s}"



