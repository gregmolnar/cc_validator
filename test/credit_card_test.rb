require 'minitest/autorun'
require_relative '../credit_card'
class CreditCardTest < MiniTest::Unit::TestCase

	def test_it_accepts_the_number_at_initialize
		number = '1234 1234 1234 1234'
		card = CreditCard.new(number)
		assert_equal card.number, number
	end
end
