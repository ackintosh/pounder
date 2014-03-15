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

  describe "#read_cmd" do
    context "@input.gets returns Command name only" do
      it "returns Command name and empty array" do
        input = double("TCPSocket")
        input.should_receive(:gets).and_return("STAT")
        @server.instance_variable_set(:@input, input)
        expect(@server.read_cmd).to eq(["cmd_STAT", []])
      end
    end

    context "@input.gets returns Command name and args" do
      it "returns Command name and an array whose elements are the args" do
        input = double("TCPSocket")
        input.should_receive(:gets).and_return("RETR 2")
        @server.instance_variable_set(:@input, input)
        expect(@server.read_cmd).to eq(["cmd_RETR", ["2"]])
      end
    end
  end
end
