require("test_helper")

class GeneratedPokemonNameTest < TestCase
  test("creates pokemon names that are large enough") do
    assert_operator(generated_pokemon_name.name.length, :>, 4)
  end

  test("creates pokemon names that are not too large") do
    assert_operator(generated_pokemon_name.name.length, :<=, 8)
  end

  private

  def generated_pokemon_name
    GeneratedPokemonName.create(corpus)
  end

  def corpus
    Corpus.new(["abra", "kadabra", "alakazam"])
  end
end
