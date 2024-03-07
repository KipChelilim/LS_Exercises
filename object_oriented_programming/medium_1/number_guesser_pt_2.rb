class GuessingGame
  def initialize(low, high)
    @guess_range = (low..high)
    @number = rand(guess_range)
    self.user_guess = 0
    self.remaining_guesses = Math.log2(guess_range.size).to_i + 1
  end

  def play
    loop do
      display_remaining_guesses
      user_enters_guess
      check_guess
      self.remaining_guesses -= 1
      break if correct_guess? || remaining_guesses == 0
    end
    display_game_result
  end

  private

  attr_reader :number, :guess_range
  attr_accessor :user_guess, :remaining_guesses, :low_value, :high_value

  def display_remaining_guesses
    plural = remaining_guesses > 1 ? "es" : nil
    puts "You have #{remaining_guesses} guess#{plural} remaining."
  end

  def user_enters_guess
    answer = nil
    prompt = "Enter a number between #{guess_range.min} and #{guess_range.max}: "
    print prompt
    loop do
      answer = gets.chomp.to_i
      break if guess_range === answer
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

game = GuessingGame.new(501, 1500)
game.play