module Pounder
  class Maildir
    def initialize(path)
      @path = path
    end

    def messages
      @messages ||=
        begin
          seq = 0
          Dir.entries(@path).select { |entry| File.ftype("#{@path}/#{entry}") == "file" }.map { |filename| Message.new(@path, filename, (seq += 1), File.size("#{@path}/#{filename}")) }
        end
    end

    def size
      messages.size
    end

    def total_octets
      messages.inject(0) { |total, message| total += message.octets }
    end

    def [](seq)
      messages.find { |m| m.seq == seq }
    end
  end
end
