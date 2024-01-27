class Cat
  def self.generic_greeting
    puts "Hello I'm a cat!"
  end
end

Cat.generic_greeting

# Further Exploration
kitty = Cat.new
kitty.class.generic_greeting
# The #class method returns a class object, not a string representation of the class. This
# means `kitty.class` is the same as `Cat` and the line is equivalent to `Cat.generic_greeting`.