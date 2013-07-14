module Cta
  module Config
    def setup(opts={}, &blk)
          opts.map do |k,v|
            const = k.to_s.upcase
            Cta.const_set(const, v) unless Cta.const_defined? const
          end
      end

    def method_missing(meth, *args, &blk)
      const = meth.to_s.upcase
      Cta.const_set(const, args.first) unless Cta.const_defined? const
    end

    extend self
  end
end