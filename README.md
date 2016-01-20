# Regexp::Trie

Builds trie-ized regexp.

Regexp::Trie takes many strings expressions and assembles them into a single regular expression that matches all that the individual REs match.

You can only add literals. a+b is treated as a\+b, not "more than one a's followed by b".

This is a Ruby port of Perl's [Regexp::Trie](https://metacpan.org/pod/Regexp::Trie "Regexp::Trie - builds trie-ized regexp - metacpan.org").

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'regexp-trie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regexp-trie

## Usage

TODO: Write usage instructions here

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/emasaka/regexp-trie.
