class PigLatin
  def self.translate(text)
    qu = /(qu)/
    xr_yt = /(xr)|(yt)/
    vowels = /[aeiou]/
    words = text.split(' ')

    words.map do |word|
      if word =~ qu
        idx = word =~ qu
        idx += 2
      elsif word[0..1] =~ xr_yt
        idx = word =~ xr_yt
      elsif word =~ vowels
        idx = word =~ vowels
      end
      'ay'.prepend(word[idx..-1], word[0...idx])
    end.join(' ')
  end
end