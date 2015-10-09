module Kor
  module Output
    class Ltsv
      def initialize(io)
        @io = io
        @keys = []
        @prekeys = nil
      end

      def parse(opt)
        opt.on("--key=KEY", "preset keys (e.g. foo,bar,baz) (default auto)") do |arg|
          @prekeys = arg
        end
      end

      def head(keys)
        @keys = keys
      end

      def puts(values)
        if @prekeys
          @io.puts @prekeys.split(",").map { |key|
            "#{key}:#{values[@keys.index(key)]}"
          }.join("\t")
        else
          @io.puts @keys.zip(values).map{ |(k,v)| "#{k}:#{v}" }.join("\t")
        end
      end

      def finish
      end
    end

    require "kor/output/ltsv/version"
  end
end
