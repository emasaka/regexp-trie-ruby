# Regexp::Trie

Builds trie-ized regexp.

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

or

    require 'regexp/trie'

    using RegexpTrieExtensions

    rt = ['who', 'where', 'when'].to_regexp_trie
    rt.to_regexp    #=> /wh(?:e(?:re|n)|o)/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'regexp-trie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regexp-trie

## Author

emasaka <emasaka@gmail.com>
