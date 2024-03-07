class Machine
  def start
    flip_switch(:on)     # self.flip_switch(:on) is okay in Ruby 2.7 or higher
  end

  def stop
    flip_switch(:off)    # self.flip_switch(:off) is okay in Ruby 2.7 or higher
  end

  def status
    switch == :on ? "The machine is on" : "The machine is off"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end