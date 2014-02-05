class CreditCard
  attr_accessor :number

  def initialize(number)
    self.number = number.gsub(/\s/, '')
    #   AMEX       | 34 or 37    | 15            |
    # +------------+-------------+---------------+
    # | Discover   | 6011        | 16            |
    # +------------+-------------+---------------+
    # | MasterCard | 51-55       | 16            |
    # +------------+-------------+---------------+
    # | Visa       | 4           | 13 or 16
    @types = {
      amex: /^3[47]\d{13}$/
    }
  end

  def type

  end
end