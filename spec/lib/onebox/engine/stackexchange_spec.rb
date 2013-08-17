require "spec_helper"

describe Onebox::Engine::StackExchange do
  describe "#to_html" do
    let(:link) { "http://stackexchange.com" }
    let(:stackexchange) { described_class.new(link).to_html }

    before do
      fake(link, response("stackexchange.response"))
    end

    it "returns the question title" do
      expect(stackexchange).to include("Concept behind these 4 lines of tricky C++ code")
    end

    it "returns the question" do
      expect(stackexchange).to include("Why does this code gives output C++Sucks? Can anyone explain the concept behind it?")
    end

    it "returns the question URL" do
      expect(stackexchange).to include(link)
    end
  end
end
