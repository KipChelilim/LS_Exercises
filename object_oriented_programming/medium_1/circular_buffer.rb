class CircularBuffer
  def initialize(size)
    @buffer = []
    @buffer_limit = size
  end

  def put(obj)
    buffer << obj
    buffer.shift if full?
  end

  def get
    buffer.shift
  end

  private

  attr_reader :buffer_limit
  attr_accessor :buffer

  def full?
    buffer.size > buffer_limit
  end
end


buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil