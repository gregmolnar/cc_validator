class CreditCard
  attr_accessor :number

  def initialize(number)
    self.number = number.gsub(/\s/, '')
    @types = {
      'AMEX' => /^3[47]\d{13}$/,
      'Discover' => /^6011\d{12}$/,
      'VISA' => /^4\d{12}|4\d{15}$/,
      'MasterCard' => /^5[1-5]\d{14}$/,
    }
  end

  def type
    @types.each do |type, rule|
      return type if self.number =~ rule
    end
    'Unknown'
  end

  def valid?
    return false if self.type == 'Unknown'
    luhn_check
  end

  # Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit
  # Sum all doubled and untouched digits in the number. For digits greater than 9 you will need to split them and sum the independently (i.e. "10", 1 + 0).
  # If that total is a multiple of 10, the number is valid.
  # For example, given the card number 4408 0412 3456 7893:

  # 1 8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3
  # 2 8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70
  # 3 70 % 10 == 0
  def luhn_check
    numbers = number.split('').reverse.each_with_index.map do |n, i|
      (i !=0 and i%2 != 0) ?  n.to_i * 2 : n
    end
    total = numbers.join().split('').map{ |n| n.to_i }.inject(:+)
    (total % 10 == 0)
  end
end
