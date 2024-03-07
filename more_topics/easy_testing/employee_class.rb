class NoExperienceError < StandardError; end

class Employee
  attr_accessor :experience
  def initialize
    @name = "John Doe"
    @experience = nil
  end

  def hire
    raise NoExperienceError if @experience.nil?
  end
end