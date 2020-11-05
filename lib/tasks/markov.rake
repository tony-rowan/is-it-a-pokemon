namespace(:markov) do
  desc("Generate stats for markov nodes")

  task(:generate) do
    require_relative("../../config/environment")

    stats = {}

    Pokemon.available.each do |pokemon|
      pokemon = OpenStruct.new(pokemon)
      previous_char = nil

      pokemon.name.chars.each do |char|
        stats[previous_char] = {} unless stats[previous_char]
        stats[previous_char][char] = 0 unless stats[previous_char][char]
        stats[previous_char][char] += 1

        previous_char = char
      end

      stats[previous_char] = {} unless stats[previous_char]
      stats[previous_char][nil] = 0 unless stats[previous_char][nil]
      stats[previous_char][nil] += 1
    end

    ap(stats)
  end
end
