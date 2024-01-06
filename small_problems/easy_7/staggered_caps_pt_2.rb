=begin
PEDAC
  start 8:57
  finish 9:07
  time 10min
Problem
  explicit rules
    same as pt 1
    but non-alphabetic characters dont count towards alternating case
  implicit rules
  clarifying questions
Examples
Data
  input:
  intermediate:
  output:
Algorithm

Idea Bank

=end

def staggered_case(string)
  upcase_the_char = true
  new_string = ""
  string.downcase.each_char do |char|
    if char =~ /[a-zA-Z]/
      case upcase_the_char
      when true  then new_string << char.upcase
      when false then new_string << char
      end
      upcase_the_char = !upcase_the_char
    else
      new_string << char
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'