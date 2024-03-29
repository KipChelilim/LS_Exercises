=begin
Problem:
  - Truck#start_engine should say "Drive #{argument}, please!" in addition to Vehicle's mssage
  - all on same line
=end

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    "#{super()} Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')