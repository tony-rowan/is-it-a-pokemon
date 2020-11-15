class GeneratedPokemonName
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.create(corpus)
    name = ""
    char = nil
    until char.nil? && name.length > corpus.min_size || name.length >= corpus.max_size
      char = corpus.next_characters[char].sample

      next if char.nil?

      name << char
    end

    new(name)
  end
end
