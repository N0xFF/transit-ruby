module Transit
  module ReadHandlers
    class NilHandler
      def from_rep(_) nil end
    end
    class KeywordHandler
      def from_rep(v) v.to_sym end
    end
    class BooleanHandler
      def from_rep(v) v == "t" end
    end
    class ByteArrayHandler
      def from_rep(v) ByteArray.from_base64(v) end
    end
    class FloatHandler
      def from_rep(v) Float(v) end
    end
    class IntegerHandler
      def from_rep(v) v.to_i end
    end
    class BigIntegerHandler
      def from_rep(v) v.to_i end
    end
    class BigDecimalHandler
      def from_rep(v) BigDecimal.new(v) end
    end
    class IdentityHandler
      def from_rep(v) v end
    end
    class SymbolHandler
      def from_rep(v) Transit::Symbol.new(v) end
    end
    class TimeStringHandler
      def from_rep(v) DateTime.iso8601(v) end
    end
    class TimeIntHandler
      def from_rep(v) DateTimeUtil.from_millis(v.to_i) end
    end
    class UuidHandler
      def from_rep(v) UUID.new(v) end
    end
    class UriHandler
      def from_rep(v) Addressable::URI.parse(v) end
    end
    class SetHandler
      def from_rep(v) Set.new(v) end
    end
    class LinkHandler
      def from_rep(v) Link.new(v) end
    end
    class CmapHandler
      def from_rep(v) Hash[*v] end
    end
  end
end