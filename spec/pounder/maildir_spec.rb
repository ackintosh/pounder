require 'spec_helper'

describe Pounder::Maildir do
  before :each do
    @maildir = Pounder::Maildir.new("/test")
  end

  describe ".size" do
    it "returns count of messages" do
      @maildir.instance_variable_set(:@messages, ["m","m","m"])
      expect(@maildir.size).to eq 3
    end
  end

  describe ".total_octets" do
    it "returns total number of bytes" do
      messages = []
      3.times do |n|
        m = Class.new
        m.stub(:octets).and_return(100)
        messages << m
      end
      @maildir.instance_variable_set(:@messages, messages)
      expect(@maildir.total_octets).to eq 300
    end
  end

  describe ".[]" do
    it "returns the message specified by the argument" do
      messages = []
      3.times do |n|
        m = Class.new
        m.instance_variable_set(:@idx, n)
        m.stub(:seq).and_return(n + 1)
        messages << m
      end
      @maildir.instance_variable_set(:@messages, messages)
      expect(@maildir[2].instance_variable_get(:@idx)).to eq 1
    end
  end
end
