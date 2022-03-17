# frozen_string_literal: true

# takes readlines file as an input and generates random
# word between 5 and 12
class Dictionary
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def load_words_between_five_twelve
    @dictionary.select { |word| word.length.between?(5, 12) }
  end

  def random_word_select
    load_words_between_five_twelve.sample
  end
end

# letter = Dictionary.new(File.readlines('words.txt', chomp: true))
