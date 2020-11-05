class GeneratedPokemonName
  def name
    _name = ""
    char = nil
    until _name.length > 3 && (char.nil? || _name.length > 20)
      char = stats[char].keys.sample

      next if char.nil?

      _name << char
    end

    _name
  end

  def stats
    @_stats ||= begin
      _stats = {}

      Pokemon.available.each do |pokemon|
        pokemon = OpenStruct.new(pokemon)
        previous_char = nil

        pokemon.name.chars.each do |char|
          _stats[previous_char] = {} unless _stats[previous_char]
          _stats[previous_char][char] = 0 unless _stats[previous_char][char]
          _stats[previous_char][char] += 1

          previous_char = char
        end

        _stats[previous_char] = {} unless _stats[previous_char]
        _stats[previous_char][nil] = 0 unless _stats[previous_char][nil]
        _stats[previous_char][nil] += 1
      end

      _stats
    end
  end
end
