class Corpus

  attr_reader :corpus

  def initialize(corpus)
    @corpus = corpus
  end

  def min_size
    @_min_size ||= corpus.min { |word| word.length }.length
  end

  def max_size
    @_max_size ||= corpus.max { |word| word.length }.length
  end

  def next_characters
    @next_characters ||= begin
      next_characters = {}

      corpus.each do |word|
        previous_char = nil

        (word.chars + [nil]).each do |char|
          next_characters[previous_char] = [] unless next_characters[previous_char]
          next_characters[previous_char] << char
          previous_char = char
        end
      end

      next_characters
    end
  end
end
