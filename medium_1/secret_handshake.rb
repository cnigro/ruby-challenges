# Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary,
# and those who don't. You and your fellow cohort of those in the "know" when
# it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

class SecretHandshake
  ACTIONS = ['wink','double blink', 'close your eyes', 'jump'].freeze

  def initialize(decimal)
    @decimal = decimal.to_i
    @binary = []
  end

  def decimal_to_binary
    until @decimal == 0 do
      @decimal, remainder = @decimal.divmod(2)
      @binary << remainder
    end
  end

  def commands
    decimal_to_binary

    commands = []
    [4, @binary.size].min.times do |i|
      commands << ACTIONS[i] if @binary[i] == 1
    end

    @binary[4] == 1 ? commands.reverse : commands
  end
end

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

# The program should consider strings specifying an invalid binary as the value 0.