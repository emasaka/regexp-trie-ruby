class Regexp
  class Trie
    VERSION = "0.1.0"

    def initialize
      @trie = {}
    end

    def add(str)
      ref = @trie
      str.each_char do |c|
        ref[c] ||= {}
        ref = ref[c]
      end
      ref[''] = nil
      self
    end

    def _regexp(node)
      return nil if node.has_key?('') and node.size == 1
      alt = []
      cc = []
      q = false
      node.keys.sort.each do |c|
        qc = Regexp.quote(c)
        if node[c]
          recurse = _regexp(node[c])
          if recurse
            alt << (qc + recurse)
          else
            cc << qc
          end
        else
          q = true
        end
      end
      cconly = alt.empty?
      !cc.empty? and alt << (cc.size == 1 ? cc[0] : '[' + cc.join('') + ']')
      result = alt.size == 1 ? alt[0] : '(?:' + alt.join('|') + ')'
      q and result = cconly ? "#{result}?" : "(?:#{result})?"
      result
    end

    def to_str
      _regexp(@trie)
    end

    def to_regexp
      Regexp.new(to_str)
    end
  end
end
