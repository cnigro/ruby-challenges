# Write a program that will convert a trinary number, represented as a
# string (e.g. '102012'), to its decimal equivalent using first principles
# (without using an existing method or library that can work with numeral
# systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid 
#trinary entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is
# the 3's place, the third to last is the 9's place, etc.


class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless is_valid?
    size = @number.size - 1
    digits = @number.to_i.digits.reverse
    digits.map.with_index.inject(0) do |sum, (value, idx)|
      sum += value*(3**(size - idx))
    end
  end

  def is_valid?
    @number.chars.none?(/[a-zA-Z3-9]/)
  end
end