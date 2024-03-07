=begin
  def in_sequence?
    test_hand = hand.sort.map(&:rank)
    first_value = test_hand.first
    straight_hand = CARD::FACE_CARD_RANKS[
  end
=end

module Dealable
  SUITS = {
    "S" => "Spades",
    "H" => "Hearts",
    "D" => "Diamonds",
    "C" => "Clubs"
  }

  SUIT_RANK = {
    "Spades" => 4,
    "Hearts" => 3,
    "Diamonds" => 2,
    "Clubs" => 1
  }

	FACES = [(2..10).to_a, "Jack" , "Queen", "King", "Ace"].flatten

	FACE_CARD_RANKS = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "Jack" => 11,
    "Queen" => 12,
    "King" => 13,
    "Ace" => 14
  }
end


class Card
  include Comparable
  include Dealable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if rank == other_card.rank
      suit_rank <=> other_card.suit_rank
    else
      face_rank <=> other_card.face_rank
    end
  end

  def suit_rank
    SUIT_RANK.fetch(suit, suit)
  end

  def face_rank
    FACE_CARD_RANKS.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

	def initialize
		create_new_deck
	end

	def create_new_deck
	  self.cards = Card::FACES.product(Card::SUITS.values)
	  cards.map! { |face, suit| Card.new(face, suit) }
	  shuffle_cards
	end

	def shuffle_cards
    cards.shuffle!
	end

	def draw
	  create_new_deck if cards.empty?
	  cards.pop
	end

	def card_count
	  cards.size
	end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_reader :cards

  def initialize(deck)
    @cards = []
    5.times { cards << deck.draw }
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  # Primary hand tests
  def royal_flush?
    straight_flush? && (cards.sort.first.rank == 10)
  end

  def straight_flush?
    same_suit? && in_sequence?
  end

  def four_of_a_kind?
    of_a_kind?(4)
  end

  def full_house?
    of_a_kind?(3) && of_a_kind?(2)
  end

  def flush?
    same_suit?
  end

  def straight?
    in_sequence?
  end

  def three_of_a_kind?
    of_a_kind?(3)
  end

  def two_pair?
    pairs = group_hand_by_rank.select do |card_rank, cards|
      cards.size == 2
    end

    pairs.keys.size == 2
  end

  def pair?
    of_a_kind?(2)
  end

  # Helper methods
  def same_suit?
    suit = cards.first.suit
    return true if cards.map(&:suit).all?(suit)
    false
  end

  def in_sequence?
    hand = cards.sort.map(&:rank)
    sequence_start = Card::FACES.index(hand.first)
    flush_hand = Card::FACES[sequence_start,hand.size]
    hand == flush_hand
  end

  def of_a_kind?(number)
    group_hand_by_rank.any? { |card_rank, cards| cards.size == number }
  end

  def group_hand_by_rank
    cards.group_by { |card| card.rank }
  end
end

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'