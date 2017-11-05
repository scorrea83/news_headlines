require "spec_helper"

RSpec.describe NewsHeadlines::Source do

  describe "#initialize" do
    it "creates Source object and sets attributes" do
      newsweek = NewsHeadlines::Source.new(name = "Newsweek", description = nil, country = "US", category = "general")
      expect(newsweek.name).to eq("Newsweek")
      expect(newsweek.category).to eq("general")
    end
  end

  let(:news_hash) {{"id"=>"abc-news-au",
    "name"=>"ABC News (AU)",
    "description"=> "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
    "url"=>"http://www.abc.net.au/news",
    "category"=>"general",
    "language"=>"en",
    "country"=>"au",
    "urlsToLogos"=>
     {"small"=>"",
      "medium"=>"",
      "large"=>""},
    "sortBysAvailable"=>["top"]}}

  describe "#new_from_json" do
    it "creates Source object with hash containing news source info and sets Source attributes from hash key,value pairs" do
      abc = NewsHeadlines::Source.new_from_json(news_hash)
      expect(abc.name).to eq("ABC News (AU)")
      expect(abc.category).to eq("general")
    end
  end

end
