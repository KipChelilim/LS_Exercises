=begin
Time
  start 806
  finish 844
  time 38min
  refactor
Problem
  create a program to  manage robot factory settings
  robots start without a name
  when they are booted up they get a random name
  when a robot is reset to factory settings, name should be wiped
  gets a new name once booted up
  names should be random and program should handle potential collisions
  prevent use of same name twice

  test cases:
    class Robot
      instance method name
        name assigned when called
      instance method reset
        wipes name when called
        have to call name again to generate new name
    name should match following pattern
      2 A-Z characters, 3 integer characters
Examples
Data
  Robot class
    `@@names` log of existing names, should remove a name once reset is invoked
  Robot instance
    `@name` to capture random name, assigned when attr is called
Algorithm
  instantiate robot class
  call `name` method
    generate random name if one hasn't been generated
    check if random name is in `@@names`
    redo assignment if its been chosen
    store name in `@@names` once picked
  call `reset` method
    delete current name from `@@names`
    set `@name` to nil
=end

class Robot
  @@all_names = []

  def name
    @name ||= assign_name
    @@all_names << @name
    @name
  end

  def reset
    @@all_names.delete(@name)
    @name = nil
  end

  # private

  def assign_name
    temp_name = nil
    loop do
      temp_name = "#{rand_ltr}#{rand_ltr}#{rand_num}#{rand_num}#{rand_num}"
      break unless @@all_names.include?(temp_name)
    end
    temp_name
  end

  def rand_ltr
    ("A".."Z").to_a.sample
  end

  def rand_num
    rand(0..9)
  end
end