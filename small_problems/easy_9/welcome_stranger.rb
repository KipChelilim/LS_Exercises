=begin
PEDAC
  start 137
  finish 144
  time 7min
Problem
  rules
    accept two arguments:
      array of two or more elements, representing a name (with spaces when joined)
      hash with two key value pairs indicating the title and occupation of person
    return a greeting using the name, title, and occupation provided
      => "Hello, {name}! Nice to have a {title} {occupation} around."
    clarifying questions:

Examples: see provided example
Data
  string interpolation
Algorithm
  create variables to store name, title, occupation from objects
  return string with variables to match greeting
Idea Bank
=end

def greetings(names, job)
  name = names.join(' ')
  title = job[:title]
  occupation = job[:occupation]
  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
