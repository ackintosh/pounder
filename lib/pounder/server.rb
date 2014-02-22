module Pounder
  class Server
    include Command

    def self.invoke(port)
      new.listen(port)
    end

    def listen(port)
      server = TCPServer.new(port)
      puts "#{self.class}##{__method__} port=#{port}"

      maildir_path = "#{Dir::pwd}/.pounder"
      puts "Maildir: #{maildir_path}"
      maildir = Maildir.new(maildir_path)

      while true
        Thread.fork(server.accept) do |sock|
          p sock
          service(sock, sock, maildir)
        end
      end
    end

    def service(input, output, maildir)
      @input  = input
      @output = output
      print_line "+OK pounder"

      while cmds = read_cmd()
        cmd_name = cmds.shift
        args     = cmds.shift
        unless respond_to?(cmd_name)
          print_line "-ERR unknown command"
          next
        end

        __send__(cmd_name, maildir, args)
      end
    end

    def print_line(str)
      @output.print "#{str}\r\n"
    end

    def print_line_message(str)
      @output.print str.sub(/\A\./, "..")
    end

    def read_cmd
      cmd_name, *args = @input.gets.split
      ["cmd_#{cmd_name.chomp}", args]
    end

    def terminate
      begin
        @input.close_read
      rescue
      end

      begin
        @output.close_write
      rescue
      end

      Thread.exit
    end
  end
end

