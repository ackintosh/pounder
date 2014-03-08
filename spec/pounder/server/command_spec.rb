require 'spec_helper'

describe Pounder::Server::Command do
  before :each do
    @server  = Pounder::Server.new
    @maildir = Pounder::Maildir.new("")
  end

  describe "#cmd_STAT" do
    it "outputs size and total_octets of Pounder::Maildir" do
      @maildir.stub(:size).and_return(100)
      @maildir.stub(:total_octets).and_return(10000)
      output = double("TCPSocket")
      output.should_receive(:print).with("+OK 100 10000\r\n")
      @server.instance_variable_set(:@output, output)
      @server.cmd_STAT(maildir: @maildir, args: [])
    end
  end
end
