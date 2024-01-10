=begin
PEDAC
  start 907
  finish 9:29
  time 22min
Problem
  rules
    create a stack and register method such that
      the "stack" is a list of values, with the last elements representing the "top"
      the register represents the current value after the last operation, initialized to 0
    allow the method to perform multiple operations as specified by a string argument
      n Place a value n in the "register". Do not modify the stack.
      PUSH Push the register value on to the stack. Leave the value in the register.
      ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
      SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
      MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
      DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
      MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
      POP Remove the topmost item from the stack and place in register
      PRINT Print the register value
    all operations are integer operations
    assume all programs will be correct
      e.g. will not call POP if stack is empty, etc
  clarifying questions
Examples: see below
Data:
  array for the stack
  register variable for input
  array for input commands
Algorithm
  accept string argument
  split it into individual commands
  for each command
    check if the value is an integer for operation n
    perform the operation based on the command
=end

def minilang(commands)
  stack = []
  register = 0
  commands.split.each do |command|
    case command
    when "PUSH"  then stack << register
    when "ADD"   then register += stack.pop
    when "SUB"   then register -= stack.pop
    when "MULT"  then register *= stack.pop
    when "DIV"   then register /= stack.pop
    when "MOD"   then register %= stack.pop
    when "POP"   then register = stack.pop
    when "PRINT" then puts register
    else              register = command.to_i
    end
  end
end



minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
p (3 + (4 * 5) - 7) / (5 % 3)
