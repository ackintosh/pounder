require 'spec_helper'

describe Pounder::Maildir::Message do
  context "when initialized" do
    before do
      @message = Pounder::Maildir::Message.new("/test", "test", 5, 100)
    end

    it "has a path" do
      expect(@message.instance_variable_get(:@dir)).to eq "/test"
    end

    it "has a filename" do
      expect(@message.instance_variable_get(:@name)).to eq "test"
    end

    it "has a sequence" do
      expect(@message.instance_variable_get(:@seq)).to eq 5
    end

    it "has a bytes" do
      expect(@message.instance_variable_get(:@octets)).to eq 100
    end
  end
end
