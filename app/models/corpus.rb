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
    @_next_characters ||= begin
      _next_characters = {}

      corpus.each do |word|
        previous_char = nil

        (word.chars + [nil]).each do |char|
          _next_characters[previous_char] = [] unless _next_characters[previous_char]
          _next_characters[previous_char] << char
          previous_char = char
        end
      end

      _next_characters
    end
  end
end
