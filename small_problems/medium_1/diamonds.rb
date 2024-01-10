=begin
PEDAC
  start 826
  finish 8:44
  time 18min
Problem
  rules
    accept an odd integer as an argument `n`
    print a diamond using the * character across `n` lines where
      the first line starts with 1 center aligned *
      each line increases in size by 1 star, still centered
      after reaching `n` * characters, each line decreases by 1
  clarifying questions?
    reject a negative or zero input? or output nothing?
      assume will be greater than 0
Algorithm
  make array of star counts per line
    from 1 up to n by 2
      [1, 3, 5, 7, 9]
    from n-1 down to 1 by 2 (slice and reverse prior array)
      [7, 5, 3, 1]
  for each line
    print a center aligned star with padding based on n
=end

def diamond(n)
  lines = 1.step(by: 2, to: n).to_a
  lines.push(*lines[0..-2].reverse)

  lines.each { |stars| puts ('*' * stars).center(n) }
end

# diamond(9)
diamond(5)