require "test_helper"

class GeneratedPokemonNameTest < ActiveSupport::TestCase
  test("can generate a pokemon name") do
    assert_not_nil(GeneratedPokemonName.new.name)
  end

  test("does not generate a name that is too small") do
    assert_operator(GeneratedPokemonName.new.name.length, :>, 3)
  end

  test("does not generate a name that is too large") do
    assert_operator(GeneratedPokemonName.new.name.length, :<, 20)
  end
end
