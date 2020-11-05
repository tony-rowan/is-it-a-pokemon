namespace :markov do
  desc("Generate stats for markov nodes")
  task(:generate) do
    require_relative("../../config/environment")

    stats = {}

    Pokemon.available.each do |pokemon|
      pokemon = OpenStruct.new(pokemon)
      puts "Generating stats for #{pokemon.name} (#{pokemon.id})"
      previous_char = nil
      pokemon.name.chars.each do |char|
        pair = [[previous_char, char]]
        stats[pair] = (stats[pair] || 0) + 1
        previous_char = char
      end
    end

    ap stats
  end
end
