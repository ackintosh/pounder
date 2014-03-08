require 'date'

module Pounder
  class Server
    module Command
      def cmd_STAT(params)
        print_line "+OK #{params[:maildir].size} #{params[:maildir].total_octets}"
      end

      def cmd_LIST(params)
        print_line "+OK"
        params[:maildir].messages.each do |m|
          print_line "#{m.seq} #{m.octets}"
        end
        print_line "."
      end

      def cmd_USER(params)
        # nop.
        print_line "+OK"
      end

      def cmd_PASS(params)
        # nop.
        print_line "+OK"
      end

      def cmd_DELE(params)
        # nop.
        print_line "+OK"
      end

      def cmd_QUIT(params)
        print_line "+OK"
        terminate
      end

      def cmd_RETR(params)
        message = params[:maildir][params[:args].first.to_i]
        print_line "+OK"
        message.each_line do |line|
          if line.match(/\ADate: .*/) then
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
