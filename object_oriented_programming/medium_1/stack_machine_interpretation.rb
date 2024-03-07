require 'pry-byebug'

class EmptyStack < StandardError; end
class InvalidCommand < StandardError; end

module RegisterCommands
  def push_register
    stack << register
  end

  def add_register
    self.register += pop_from_stack
  end

  def sub_register
    self.register -= pop_from_stack
  end

  def mult_register
    self.register *= pop_from_stack
  end

  def div_register
    self.register /= pop_from_stack
  end

  def mod_register
    self.register %= pop_from_stack
  end

  def pop_register
    self.register = pop_from_stack
  end

  def print_register
    puts register
  end

  def set_register(value)
    self.register = value
  end

  def empty?
    stack.empty?
  end

  def pop_from_stack
    raise EmptyStack if stack.empty?
    stack.pop
  end
end

class Minilang
  attr_accessor :stack_and_register, :command_list, :invalid_command
  attr_reader :string_commands

  def initialize(str_commands)
    @string_commands = str_commands
    @stack_and_register = StackAndRegister.new
    @command_list = []
  end

  def create_command_list
    string_commands.split.each do |command|
      method_name = "#{command.downcase}_register".to_sym
      if command.to_i.to_s == command
        command_list << [:set_register, command.to_i]
      elsif valid_command?(method_name)
          command_list << method_name
      else
       self.invalid_command = command
       raise InvalidCommand
      end
    end
  end

  def eval
    create_command_list
    command_list.each do |command|
      # binding.pry
      stack_and_register.send(*command)
    end

    rescue InvalidCommand
      puts "Invalid token: #{invalid_command}"
    rescue EmptyStack
      puts "Empty stack!"
  end

  private

  def valid_command?(command)
    return true if stack_and_register.respond_to?(command)
    false
  end
end

class StackAndRegister
  include RegisterCommands

  attr_accessor :stack, :register

  def initialize
    @stack = []
    @register = 0
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)