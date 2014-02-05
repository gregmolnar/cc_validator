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
end