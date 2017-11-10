require "spec_helper"

RSpec.describe NewsHeadlines::Article do

  describe "#initialize" do
    it "creates Article object and sets attributes" do
      article = NewsHeadlines::Article.new(title = "Breaking News", author = "reporter", news_source = "source object", description = "article summary", url = "http://fake.website.com", published_at = "017-11-09T20:05:47Z")
      expect(article.title).to eq("Breaking News")
      expect(article.news_source).to eq("source object")
    end
  end


end
