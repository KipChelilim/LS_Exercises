require "minitest/autorun"
require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction_1 = Transaction.new(5)
    @transaction_1.amount_paid = 6
  end

  def test_accept_money
    expected = @register.total_money + @transaction_1.amount_paid
    assert_equal(expected, @register.accept_money(@transaction_1))
  end

  def test_change
    change = @transaction_1.amount_paid - @transaction_1.item_cost
    assert_equal(change, @register.change(@transaction_1))
  end

  def test_give_receipt
    item_cost = @transaction_1.item_cost
    assert_output("You've paid $#{item_cost}.\n") { @register.give_receipt(@transaction_1) }
  end
end