require 'test_helper'

class Regexp::TrieTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Regexp::Trie::VERSION
  end

  def test_match_3_strings
    re = %w(who where when).
         reduce(Regexp::Trie.new) {|r, v| r.add(v) }.
         to_regexp

    assert_match re, 'who', "#{re} matches 'who'"
    assert_match re, 'where', "#{re} matches 'where'"
    assert_match re, 'when', "#{re} matches 'when'"

    assert !(re =~ 'which'), "#{re} doesn't matche 'which'"
    assert !(re =~ 'wh'), "#{re} doesn't matche 'wh'"
  end
end
