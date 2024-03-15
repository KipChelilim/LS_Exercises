=begin
start 441 506 25 min
end
time

Problem
-calculate the Hamming distance between two DNA strands
  definition: count of different nucleotides
              difference determined at same point in strand
              only applies to strands of equal length
  if strands of unequal length, only look at shortest length
- create a DNA object that accepts a string at instantiation
  - hamming_distance method should accept a string, return an integer
    - public instance method
Data
  DNA object, with `strand` referencing string object
  hamming_distance method accepts string for comparison
  need to split each string into chars for comparison
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    short_strand, long_strand = [strand, other_strand].sort_by(&:size)
    comparison = short_strand.chars.zip(long_strand.chars)
    comparison.select { |pair| pair.uniq.size > 1 }.size
  end

  private

  attr_reader :strand
end