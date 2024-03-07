class GuessingGame
  TOTAL_GUESSES = 7
  GUESS_RANGE = (1..100)

  def initialize
    @number = rand(GUESS_RANGE)
    @user_guess = 0
    @remaining_guesses = TOTAL_GUESSES
  end

  def play
    loop do
      display_remaining_guesses
      user_enters_guess
      check_guess
      break if correct_guess? || remaining_guesses == 0
      self.remaining_guesses -= 1
    end
    display_game_result
  end

  private

  attr_reader :number
  attr_accessor :user_guess, :remaining_guesses

  def display_remaining_guesses
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def user_enters_guess
    answer = nil
    prompt = "Enter a number between #{GUESS_RANGE[0]} and #{GUESS_RANGE[-1]}: "
    print prompt
    loop do
      answer = gets.chomp.to_i
      break if GUESS_RANGE === answer
      print "Invalid guess. #{prompt}"
    end
    self.user_guess = answer
  end

  def check_guess
    puts(
      if correct_guess?
        "That's the number!"
      elsif user_guess < number
        "Your guess is too low."
      elsif user_guess > number
        "Your guess is too high."
      end
    )
    puts "\n"
  end

  def display_game_result
    puts(
      if correct_guess?
        "You won!"
      else
        "You have no more guesses. You lost!"
      end
    )
  end

  def correct_guess?
    user_guess == number
  end
end

game = GuessingGame.new
game.play