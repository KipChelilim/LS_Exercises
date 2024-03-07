require "minitest/autorun"
require_relative "text"

class TextTest < Minitest::Test
  def setup
    @sample_text = File.read("sample_text.txt")
    @text_object = Text.new(@sample_text)
  end

  def test_swap
    swapped_text = @text_object.swap("a", "e")
    test_word_after = swapped_text.split[-2]
    assert_equal("pheretre", test_word_after)
  end

  def test_word_count
    assert_equal(@sample_text.split.size, @text_object.word_count)
  end

  def teardown
    # Omitted as I used the class method IO::read to open and close the file in
    # one line.
  end
end