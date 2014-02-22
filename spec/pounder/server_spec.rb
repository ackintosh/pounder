require 'spec_helper'

describe Pounder::Server do
  before :each do
    @server = Pounder::Server.new
  end

  describe "#print_line" do
    it "outputs by adding new line to string" do
      output = double("TCPSocket")
      output.should_receive(:print).with("test\r\n")
      @server.instance_variable_set(:@output, output)
      @server.print_line("test")
    end
  end

  describe "#print_line_message" do
    it "outputs by replacing the dot at the beginning of the line" do
      output = double("TCPSocket")
      output.should_receive(:print).with("..test")
      @server.instance_variable_set(:@output, output)
      @server.print_line_message(".test")
    end
  end
end
