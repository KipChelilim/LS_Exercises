=begin
Time
  start 1044
  finish 1136
  time 52 min due to an easy mistake. double check typos
  refactor
Problem
  generate the lyrics of the 99 bottles of beer song
  test cases:
    class BeerSong
    class method verse
      accepts one or two arguments
        first is initial verse, second is last verse
        numbers represent indices
    class method lyrics
      returns entire song
Data
  array for each verse
    each element is the index + lyrics + index - 1
Algorithm
  verse:
    accept
=end

class BeerSong
  def self.verses(first_verse, last_verse = nil)
    last_verse = first_verse if last_verse.nil?
    each_verse = []
    first_verse.downto(last_verse) do |bottles|
      each_verse.push(verse(bottles))
    end
    each_verse.join("\n")
  end

  def self.verse(bottles)
    case bottles
    when 0 then self.final_verse
    when 1 then self.one_bottle_verse
    when 2 then self.two_bottles_verse
    else        self.normal_verse(bottles)
    end
  end

  def self.lyrics
    self.verses(99, 0)
  end

  class << self
    private

    def normal_verse(bottles)
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n"\
      "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
    end

    def two_bottles_verse
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def one_bottle_verse
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def final_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end