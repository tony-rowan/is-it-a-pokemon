require "test_helper"

class CorpusTest < TestCase
  test("min_size") do
    assert_equal(corpus.min_size, 4)
  end

  test("max_size") do
    assert_equal(corpus.max_size, 8)
  end

  test("next_characters") do
    assert_equal(
      corpus.next_characters,
      {
        nil => ["a", "k", "a"],
        "a" => ["b", nil, "d", "b", nil, "l", "k", "z", "m"],
        "b" => ["r", "r"],
        "d" => ["a"],
        "k" => ["a", "a"],
        "l" => ["a"],
        "m" => [nil],
        "r" => ["a", "a"],
        "z" => ["a"]
      }
    )
  end

  private

  def corpus
    Corpus.new(["abra", "kadabra", "alakazam"])
  end
end
