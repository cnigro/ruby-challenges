class Luhn
  def initialize(num)
    @num = num
  end

  def checksum
    addends.sum
  end

  def addends
    addends = @num.digits.map.with_index do |value, idx|
      idx.odd? ? value * 2 : value
    end
    addends.reverse.map do |addend|
      addend > 10 ? addend - 9 : addend
    end
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    num = number * 10
    new(num).valid? ? num : num += 10 - new(num).checksum % 10
  end
end