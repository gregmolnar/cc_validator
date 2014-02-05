require 'minitest/autorun'
require_relative '../lib/credit_card'
class CreditCardTest < MiniTest::Unit::TestCase

	def setup
		@cards = [
			{number: '4111111111111111', type: 'VISA', valid: true},
			{number: '4111111111111', type: 'VISA', valid: false},
			{number: '4012888888881881', type: 'VISA', valid: true},
			{number: '378282246310005', type: 'AMEX', valid: true},
			{number: '6011111111111117', type: 'Discover', valid: true},
			{number: '5105105105105100', type: 'MasterCard', valid: true},
			{number: '5105105105105106', type: 'MasterCard', valid: false},
			{number: '9111111111111111', type: 'Unknown', valid: false}
		]
	end

	def test_it_accepts_the_number_at_initialize
		number = '1234 1234 1234 1234'
		card = CreditCard.new(number)
		assert_equal card.number, number.gsub(/\s/, '')
	end

	def test_it_extracts_the_type
		@cards.each do |card|
			c = CreditCard.new(card[:number])
			assert_equal card[:type], c.type
		end
	end

	def test_it_validates_card
		@cards.each do |card|
			c = CreditCard.new(card[:number])
			assert_equal card[:valid], c.valid?
		end
	end
end
