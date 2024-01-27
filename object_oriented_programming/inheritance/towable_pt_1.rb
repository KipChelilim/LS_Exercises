=begin
-create a towable module
-module should have method tow
-tow should print "I can tow a trailer!" when invoked
-module should be part of Truck class
=end

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow