# Write a program that given a phrase can count the occurrences of each word in that phrase.

class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    @text.split(/ |, |,|:/).each_with_object(Hash.new(0)) do |word, count|
      next if word == ''
      found = (/'/ =~ word)
      if found
        (/'/ =~ word).zero? ? word = word[1..-2] : word
      end
      count[word.gsub(/[^\w']/, '').downcase] += 1
    end
  end
end
