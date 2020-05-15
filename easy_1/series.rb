# Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:
# - 012
# - 123
# - 234

# And the following 4-digit series:
# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

class Series
  def initialize(numbers)
    @numbers = numbers.chars.map { |c| c.to_i }
    @cons = []
  end

  def slices(size)
    raise ArgumentError if size > @numbers.size
    @numbers.each_cons(size) { |cons| @cons << cons }
    @cons
  end
end
