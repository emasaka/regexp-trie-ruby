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

    refute_match re, 'which', "#{re} doesn't matche 'which'"
    refute_match re, 'wh', "#{re} doesn't matche 'wh'"
  end

  def test_exact_match
    str = %w(ab abc).
          reduce(Regexp::Trie.new) {|r, v| r.add(v) }.
          to_str
    re = Regexp.new('\A' + str + '\z')

    assert_match re, 'ab',  "#{re} matches 'ab'"
    assert_match re, 'abc',  "#{re} matches 'abc'"

    refute_match re, 'abz', "#{re} doesn't matche 'abz'"
  end
end
