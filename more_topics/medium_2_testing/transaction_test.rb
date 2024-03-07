require "minitest/autorun"
require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(10)
    input = StringIO.new("30\n")
    capture_io { transaction.prompt_for_payment_mod(input: input) }
    expected = input.string.chomp.to_f
    assert_equal(expected, transaction.amount_paid)
  end
end