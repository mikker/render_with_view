module RenderWithLocals
  # Like OpenStruct but doesn't let you read a non-assigned value (raises
  # instead of returning nil). This avoids issues where you read the wrong
  # value due to a typo and don't notice.
  #
  # Borrowed from @henrik,
  # https://gist.github.com/henrik/19c68b2a41ab4d098ce8

  class HalfOpenStruct
    def initialize(hash = {})
      @hash = hash
    end

    def include?(name)
      @hash.include?(name)
    end

    def fetch(name, fallback)
      @hash.fetch(name, fallback)
    end

    def method_missing(name, *args)
      if name.to_s.end_with?("=")
        write(name.to_s.chop.to_sym, *args)
      elsif args.length == 0
        read_or_raise(name)
      else
        raise NoMethodError
      end
    end

    private

    def write(name, value)
      @hash[name] = value
    end

    def read_or_raise(name)
      @hash.fetch(name) { raise "Unknown key: #{name}" }
    end
  end
end
