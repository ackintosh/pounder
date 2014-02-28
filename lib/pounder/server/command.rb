require 'date'

module Pounder
  class Server
    module Command
      def cmd_STAT(maildir, args)
        print_line "+OK #{maildir.size} #{maildir.total_octets}"
      end

      def cmd_LIST(maildir, args)
        print_line "+OK"
        maildir.messages.each do |m|
          print_line "#{m.seq} #{m.octets}"
        end
        print_line "."
      end

      def cmd_USER(maildir, args)
        # nop.
        print_line "+OK"
      end

      def cmd_PASS(maildir, args)
        # nop.
        print_line "+OK"
      end

      def cmd_DELE(maildir, args)
        # nop.
        print_line "+OK"
      end

      def cmd_QUIT(maildir, args)
        print_line "+OK"
        terminate
      end

      def cmd_RETR(maildir, args)
        message = maildir[args.first.to_i]
        print_line "+OK"
        message.each_line do |line|
          if line.match(/^Date: .*/) then
            # Outputs a Date header of the time it was run.
            print_line_message "Date: #{DateTime.now.httpdate}"
            next
          end
          print_line_message line
        end

        # To prevent dot to become a part of the body,
        # and outputs a new line.
        print_line ""
        print_line "."
      end
    end
  end
end
