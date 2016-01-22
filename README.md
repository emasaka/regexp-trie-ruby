# Regexp::Trie

Builds trie-ized regexp.

*This project is not maintained.  Use [gfx/regexp_trie](https://github.com/gfx/ruby-regexp_trie) instead.*

## Description

Regexp::Trie takes many strings expressions and assembles them into a single regular expression that matches all that the individual REs match.

You can only add literals. a+b is treated as a\+b, not "more than one a's followed by b".

This is a Ruby port of Perl's [Regexp::Trie](https://metacpan.org/pod/Regexp::Trie "Regexp::Trie - builds trie-ized regexp - metacpan.org").

## Usage

    require 'regexp/trie'

    rt = Regexp::Trie.new
    rt.add('who')
    rt.add('where')
    rt.add('when')

    rt.to_str       #=> "wh(?:e(?:re|n)|o)"
    rt.to_regexp    #=> /wh(?:e(?:re|n)|o)/

## Author

emasaka <emasaka@gmail.com>
