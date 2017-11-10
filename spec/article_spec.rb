require "spec_helper"

RSpec.describe NewsHeadlines::Article do

  describe "#initialize" do
    it "creates Article object and sets attributes" do
      article = NewsHeadlines::Article.new(title = "Breaking News", author = "reporter", description = "article summary", url = "http://fake.website.com", published_at = "017-11-09T20:05:47Z")
      expect(article.title).to eq("Breaking News")
      expect(article.description).to eq("article summary")
    end
  end

  let(:article_hash) {{
      "author" => "Heather DinichESPN Senior Writer ",
      "title" => "Survival of the fittest in the sprint to the CFP finish",
      "description" => "It's survive and advance Week 11, with playoff elimination games with Notre Dame-Miami and TCU-Oklahoma, and the top two, Georgia and Alabama, face ranked opponents on the road.",
      "url" => "http://www.espn.com/college-football/story/_/page/gamedaykickoff110917/survive-advance-cfp-elimination-games-week-11",
      "urlToImage" => "http://a2.espncdn.com/combiner/i?img=%2Fphoto%2F2017%2F1108%2Fr286333_1296x729_16%2D9.jpg",
      "publishedAt" => "2017-11-09T14:00:00Z"
    }}

  describe "#new_from_json" do
    it "creates Article object with hash argument containing article info and sets Article attributes from hash key,value pairs" do
      article = NewsHeadlines::Article.new_from_json(article_hash)
      expect(article.author).to eq("Heather DinichESPN Senior Writer ")
      expect(article.title).to eq("Survival of the fittest in the sprint to the CFP finish")
      expect(article.news_source).to eq(nil)

    end
  end


end
