module Pounder
  class Maildir
    class Message
      attr_reader :octets, :seq

      def initialize(dir, name, seq, octets)
        @dir      = dir
        @name     = name
        @seq      = seq
        @octets   = octets
      end

      def each_line
        File.foreach("#{@dir}/#{@name}") do |line|
          yield line.sub(/\r?\n\z/, "\r\n")
        end
      end
    end
  end
end
