class Card
  include Comparable

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

  SUIT_RANK = {
    "Spades" => 4,
    "Hearts" => 3,
    "Diamonds" => 2,
    "Clubs" => 1
  }

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
  SUITS = {
    "S" => "Spades",
    "H" => "Hearts",
    "D" => "Diamonds",
    "C" => "Clubs"
  }

	FACES = [(2..10).to_a, "Jack" , "Queen", "King", "Ace"].flatten

  attr_accessor :cards

	def initialize
		create_new_deck
	end

	def create_new_deck
	  self.cards = FACES.product(SUITS.values)
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

deck = Deck.new

drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.