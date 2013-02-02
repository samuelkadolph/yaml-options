require "yaml"

module YAML
  class Options < Hash
    require "yaml/options/version"

    def self.load(str)
      hash = YAML.load(str)
      raise ArgumentError, "str must be a YAML hash" unless hash.is_a?(Hash)
      new(hash)
    end

    alias _key key
    undef key

    def initialize(hash = {})
      hash.each do |key, value|
        self[key] = convert(value)
      end
    end

    def [](key)
      super(key.to_sym)
    end

    def []=(key, value)
      super(key.to_sym, value)
    end

    def method_missing(name, *args)
      name_string = name.to_s
      if name_string.chomp!("=")
        self[name_string] = args.first
      else
        self[name]
      end
    end

    def respond_to_missing?(name, include_private)
      true
    end

    private
    def convert(what)
      case what
      when Array
        what.map { |element| convert(element) }
      when Hash
        self.class.new(what)
      else
        what
      end
    end
  end
end
