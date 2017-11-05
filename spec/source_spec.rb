require "spec_helper"

RSpec.describe NewsHeadlines::Source do

  describe "#initialize" do
    it "creates Source object and sets attributes" do
      newsweek = NewsHeadlines::Source.new(name = "Newsweek", description = nil, country = "US", category = "general")
      expect(newsweek.name).to eq("Newsweek")
      expect(newsweek.category).to eq("general")
    end
  end

end
