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

  describe "#cmd_QUIT" do
    it "prints '+OK' and terminate the thread" do
      output = double("TCPSocket")
      output.should_receive(:print).with("+OK\r\n")
      @server.instance_variable_set(:@output, output)
      expect(@server).to receive(:terminate)
      @server.send(:cmd_QUIT, maildir: @maildir, args: [])
    end
  end

  shared_examples("no operation") do |cmd|
    it "prints '+OK'" do
      output = double("TCPSocket")
      output.should_receive(:print).with("+OK\r\n")
      @server.instance_variable_set(:@output, output)
      @server.send(cmd, maildir: @maildir, args: [])
    end
  end

  describe "#cmd_USER" do
    it_behaves_like "no operation", :cmd_USER
  end

  describe "#cmd_PASS" do
    it_behaves_like "no operation", :cmd_PASS
  end

  describe "#cmd_DELE" do
    it_behaves_like "no operation", :cmd_DELE
  end
end
