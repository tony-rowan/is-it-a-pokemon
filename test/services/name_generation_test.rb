require "test_helper"

class NameGenerationTest < ActiveSupport::TestCase
  test("can generate a name") do
    assert_not_nil(generate)
  end

  test("does not generate a name that is too small") do
    assert_operator(generate(min: 3).length, :>, 3)
  end

  test("does not generate a name that is too large") do
    assert_operator(generate(max: 20).length, :<, 20)
  end

  def generate(min: 1, max: 10)
    NameGeneration.new(Pokemon.available.map { |p| p[:name] }).generate(min, max)
  end
end
